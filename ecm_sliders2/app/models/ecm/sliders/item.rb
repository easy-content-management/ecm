module Ecm
  module Sliders
    class Item < ActiveRecord::Base
      # acts as list
      acts_as_list scope: :slider_id

      # acts as markup
      acts_as_markup language: :variable, columns: [ :body ]

      # associations
      belongs_to :slider, inverse_of: :items

      # callbacks
      after_initialize :set_defaults, if: :new_record?

      # attachments
      has_one_attached :image

      # validations
      validates :slider, presence: true
      validates :image, presence: true
      validates :markup_language, :presence  => true,
                                  :inclusion => Ecm::Sliders::Configuration.markup_languages

      def human
        "#{slider.class.model_name.human} #{slider.human} - #{self.class.model_name.human} #{id}"
      end

      private

      def set_defaults
        self.markup_language ||= Ecm::Sliders::Configuration.default_markup_language
      end
    end
  end
end
