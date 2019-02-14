class Ecm::Cms::Navigation < ActiveRecord::Base
  # associations
  has_many :ecm_cms_navigation_items,
           class_name: 'Ecm::Cms::NavigationItem',
           dependent: :destroy,
           foreign_key: 'ecm_cms_navigation_id'

  # validations
  validates :locale, inclusion: I18n.available_locales.map(&:to_s),
                     allow_nil: true,
                     allow_blank: true
  validates :name, presence: true,
                   uniqueness: { scope: [:locale] }

  delegate :count, to: :ecm_cms_navigation_items, prefix: true

  def human
    "#{name} (#{locale})"
  end
end
