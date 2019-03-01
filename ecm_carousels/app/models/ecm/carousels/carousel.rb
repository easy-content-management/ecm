module Ecm
  module Carousels
    class Carousel < ActiveRecord::Base
        has_many_attached :assets
      # # associations
      # has_many :items, -> { order(:position) },
      #          dependent: :destroy,
      #          inverse_of: :carousel

      # accepts_nested_attributes_for :items, allow_destroy: true

      # scopes
      scope :for_locale, ->(locale) { where(self.arel_table[:locale].eq(locale).or(self.arel_table[:locale].eq(nil))).order(locale: :desc) }

      # validations
      validates :locale, inclusion: I18n.available_locales.map(&:to_s),
                        if: proc { |carousel| carousel.locale.present? }
      validates :identifier, presence: true,
                            uniqueness: { scope: [:locale] }

      def human
        "#{identifier} (#{locale})"
      end

      def item_details_count
        item_details.count
      end

      module ItemDetailsConcern
        extend ActiveSupport::Concern

        included do
          has_many :item_details, dependent: :destroy
          before_validation :cleanup_orphaned_item_details
          before_validation :ensure_item_details
        end

        private

        def cleanup_orphaned_item_details
          item_details.reload.each do |item_detail|
            item_detail.destroy if item_detail.asset.nil?
          end
        end

        def ensure_item_details
          (assets.to_a - item_details.all.map(&:asset)).map do |asset|
            build_item_detail_for_asset(asset)
          end
        end

        def build_item_detail_for_asset(asset)
          item_details.build(asset: asset)
        end
      end

      include ItemDetailsConcern

      module AppenadableAssetsConcern
        extend ActiveSupport::Concern

        def append_assets
          assets
        end

        def append_assets=(assets)
          self.assets.attach(assets)
        end

        def overwrite_assets
          assets
        end

        def overwrite_assets=(assets)
          return if assets.nil? || assets.empty?
          self.item_details.map { |id| id.mark_for_destruction }
          self.assets = assets
        end
      end

      include AppenadableAssetsConcern

      module VariantOptionsConcern
        extend ActiveSupport::Concern

        included do
          attr_accessor :height, :width
          
          serialize :variant_options
          
          validates :width, numericality: true, allow_nil: true
          validates :height, numericality: true, allow_nil: true
          
          before_validation :set_variant_options
        end

        private

        def set_variant_options
          self.variant_options = build_variant_options
        end

        def build_variant_options
          { resize: "#{width}x#{height}" }
        end
      end

      include VariantOptionsConcern
    end
  end
end
