class Ecm::Cms::Folder < ActiveRecord::Base
  # associations
  has_many :ecm_cms_pages,
           class_name: 'Ecm::Cms::Page',
           dependent: :destroy,
           foreign_key: 'ecm_cms_folder_id'
  has_many :ecm_cms_partials,
           class_name: 'Ecm::Cms::Partial',
           dependent: :destroy,
           foreign_key: 'ecm_cms_folder_id'
  has_many :ecm_cms_templates,
           class_name: 'Ecm::Cms::Template',
           dependent: :destroy,
           foreign_key: 'ecm_cms_folder_id'

  # validations
  validates :basename, presence: true
  validates :pathname, presence: true
end
