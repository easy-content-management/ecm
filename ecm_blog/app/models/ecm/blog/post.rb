module Ecm
  module Blog
    class Post < ActiveRecord::Base
      include Model::Ecm::Comments::CommentableConcern if Ecm::Blog.features?(:ecm_comments)
      include Model::Ecm::Tags::TaggableConcern if Ecm::Blog.features?(:ecm_tags)

      # publishing
      include ActsAsPublished::ActiveRecord
      acts_as_published

      # positioning
      acts_as_list
      default_scope { order(position: :desc) }

      # assets
      has_many_attached :assets if respond_to?(:has_many_attached)

      # slugs
      extend FriendlyId
      friendly_id :title, use: :slugged

      belongs_to :creator, class_name: Ecm::Blog.creator_class_name, foreign_key: 'created_by_id'
      belongs_to :updater, class_name: Ecm::Blog.creator_class_name, foreign_key: 'updated_by_id', optional: true

      scope :for_date, ->(year, month, day) { where(created_at: "#{year}-#{month || 1}-#{day || 1}".to_date.beginning_of_month.."#{year}-#{month || 1}-#{day || 1}".to_date.end_of_month) }

      def human
        title
      end

      module Markdown
        def body(format: nil)
          case format
          when :html
            to_markdown(read_attribute(:body))
          else
            read_attribute(:body)
          end
        end

        private

        def to_markdown(string)
          Kramdown::Document.new(string).to_html
        end
      end

      include Markdown

      module AssetDetailsConcern
        extend ActiveSupport::Concern

        included do
          has_many :asset_details, inverse_of: :post, dependent: :destroy, autosave: true
          before_validation :cleanup_orphaned_asset_details
          before_validation :ensure_asset_details
        end

        def asset_details_count
          asset_details.count
        end

        def append_assets
          assets
        end

        def append_assets=(assets)
          if Rails.version < '6.0.0'
            self.assets = assets
          else
            self.assets.attach(assets)
          end
        end

        def overwrite_assets
          assets
        end

        def overwrite_assets=(assets)
          return if assets.nil? || assets.empty?
          self.asset_details.map { |ad| ad.mark_for_destruction }
          self.assets = assets
        end

        private

        def cleanup_orphaned_asset_details
          asset_details.each do |asset_detail|
            asset_detail.destroy if asset_detail.asset.nil?
          end
        end

        def ensure_asset_details
          (assets - asset_details.all.map(&:asset)).map do |asset|
            build_asset_detail_for_asset(asset)
          end
        end

        def build_asset_detail_for_asset(asset)
          asset_details.build(asset: asset)
        end
      end

      include AssetDetailsConcern if respond_to?(:has_many_attached)

      module PreviewPictureConcern
        extend ActiveSupport::Concern

        def preview_picture
          asset_details.images.first
        end
      end

      include PreviewPictureConcern
    end
  end
end
