module Ecm::Files
  class Folder < ApplicationRecord
    include ActsAsPublished::ActiveRecord

    has_many_attached :assets

    acts_as_published

    validates :name, presence: true, uniqueness: true

    def human
      "#{self.class.model_name.human}: #{I18n.l(created_at)}"
    end

    def assets_count
      assets.count
    end

    module FileDetails
      extend ActiveSupport::Concern

      included do
        has_many :file_details, dependent: :destroy
        before_validation :cleanup_orphaned_file_details
        before_validation :ensure_file_details
      end

      private

      def cleanup_orphaned_file_details
        file_details.each do |file_detail|
          file_detail.destroy if file_detail.asset.nil?
        end
      end

      def ensure_file_details
        (assets - file_details.all.map(&:asset)).map do |asset|
          build_file_detail_for_asset(asset)
        end
      end

      def build_file_detail_for_asset(asset)
        file_details.build(asset: asset)
      end
    end

    include FileDetails
  end
end
