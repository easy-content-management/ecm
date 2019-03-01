module Ecm
  module Carousels
    class ItemDetail < ActiveRecord::Base
      belongs_to :carousel
      belongs_to :asset, class_name: 'ActiveStorage::Attachment', dependent: :destroy      
      
      # acts as list
      acts_as_list scope: :carousel_id

      # # acts as markup
      # acts_as_markup language: :variable, columns: [ :body ]

      # # associations
      # belongs_to :carousel, inverse_of: :items

      # # callbacks
      # after_initialize :set_defaults, if: :new_record?

      # # attachments
      # has_one_attached :image

      # # validations
      # validates :carousel, presence: true
      # validates :image, presence: true
      # validates :markup_language, :presence  => true,
      #                             :inclusion => Ecm::Carousels::Configuration.markup_languages

      # def human
      #   "#{carousel.class.model_name.human} #{carousel.human} - #{self.class.model_name.human} #{id}"
      # end

      # private

      # def set_defaults
      #   self.markup_language ||= Ecm::Carousels::Configuration.default_markup_language
      # end
    end
  end
end
