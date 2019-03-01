require 'rails_helper'

RSpec.describe 'Translations', type: :model do
  {
    ActiveStorage::Attachment                => {},
    ActiveStorage::Blob                      => {},
    ActsAsTaggableOn::Tag                    => {},
    ActsAsTaggableOn::Tagging                => {},
    # Delayed::Backend::ActiveRecord::Job      => {},
    Ecm::Blog::Post                          => {},
    Ecm::Blog::AssetDetail                   => {},
    Ecm::Cms::ContentBox                     => {},
    # Ecm::Cms::Folder                         => {},
    Ecm::Cms::Navigation                     => {},
    Ecm::Cms::NavigationItem                 => {},
    Ecm::Cms::Page                           => {},
    Ecm::Cms::Page::ContentBlock             => {},
    Ecm::Cms::Partial                        => {},
    Ecm::Cms::Template                       => {},
    # Ecm::Comments::Comment                   => {},
    Ecm::Contact::ContactRequest             => {},
    Ecm::Files::FileDetail                   => {},
    Ecm::Files::Folder                       => {},
    Ecm::Galleries::PictureDetail            => {},
    Ecm::Galleries::PictureGallery           => {},
    Ecm::Links::Category                     => {},
    Ecm::Links::Link                         => {},
    Ecm::Rbac::Permission                    => {},
    Ecm::Rbac::Role                          => {},
    Ecm::Rbac::RolePermission                => {},
    Ecm::Rbac::UserRole                      => {},
    # Ecm::Sliders::Item                       => {},
    # Ecm::Sliders::Slider                     => {},
    Ecm::Tags::Tag                           => {},
    Ecm::Tags::Tagging                       => {},
    # Ecm::Translations::Translation           => {},
    Ecm::UserArea::User                      => {},
    # Vovinam::Category                        => {},
    # Vovinam::Entry                           => {},
    # Vovinam::Level                           => {},
    # Vovinam::LevelTopic                      => {},
    # Vovinam::Term                            => {},
    # Vovinam::Topic                           => {},
    # I18n::Backend::ActiveRecord::Translation => {},
  }.each do |model, options|
    I18n.available_locales.each do |locale|
      I18n.locale = locale

      describe "for locale #{locale}:" do
        describe "#{model} translations" do
          it 'include one' do
            I18n.locale = locale
            i18n_key = ['activerecord', 'models', model.name.underscore].join('.')
            i18n_options = {}
            expect(I18n.translate!(i18n_key, options)[:one]).to be_a(String)
          end

          it 'include other' do
            I18n.locale = locale
            i18n_key = ['activerecord', 'models', model.name.underscore].join('.')
            i18n_options = {}
            expect(I18n.translate!(i18n_key, options)[:other]).to be_a(String)
          end

          describe 'for attributes' do

            model.column_names.each do |column_name|
              it "include #{column_name}" do
                I18n.locale = locale
                i18n_key = ['activerecord', 'attributes', model.name.underscore, column_name].join('.')
                expect(I18n.translate!(i18n_key)).to be_a(String)
              end
            end
          end
        end
      end
    end
  end
end
