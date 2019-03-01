require 'rails_helper'

RSpec.describe '/de/backend/bilder/picture_galleries', type: :feature, locale: :de do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Galleries::PictureGallery }
  let(:resource) { create(:ecm_galleries_picture_gallery) }
  let(:resources) { create_list(:ecm_galleries_picture_gallery, 3) }

  # List
  it { resources; expect(subject).to implement_index_action(self) }

  # Create
  it { 
    expect(subject).to implement_create_action(self)
      .for(resource_class)
      .within_form('#new_picture_gallery') {
        # fill the needed form inputs via capybara here
        #
        # Example:
        #
        #     select 'de', from: 'slider[locale]'
        #     fill_in 'slider[name]', with: 'My first slider'
        #     check 'slider[auto_start]'
        #     fill_in 'slider[interval]', with: '3'
        fill_in 'picture_gallery[name]', with: 'My first gallery'
        attach_file 'picture_gallery[assets][]', [Ecm::Galleries::Engine.root.join(*%w(spec files ecm galleries picture_details example.png))]
        check 'picture_gallery[published]'
      }
      .increasing{ Ecm::Galleries::PictureGallery.count }.by(1)
    }

  # Read
  it { expect(subject).to implement_show_action(self).for(resource) }

  # Update
  it {
    expect(subject).to implement_update_action(self)
    .for(resource)
    .within_form('.edit_picture_gallery') {
      # fill the needed form inputs via capybara here
        # 
        # Example:
        # 
        #     fill_in 'slider[name]', with: 'New name'
        fill_in 'picture_gallery[name]', with: 'A new name'
      }
      .updating
      .from(resource.attributes)
      .to({ 'name' => 'A new name' }) # Example: .to({ 'name' => 'New name' })
  }

  # Delete
  it {
    expect(subject).to implement_delete_action(self)
    .for(resource)
    .reducing{ resource_class.count }.by(1)
  }

  describe 'appending picture details' do
    let(:base_path) { '/de/backend/bilder/picture_galleries' }
    let(:edit_path) { "#{base_path}/#{resource.to_param}/edit" }

    let(:picture_detail) { create(:ecm_galleries_picture_detail, picture_gallery: resource) }

    let(:submit_button) { within('form.edit_picture_gallery') { first('input[type="submit"]') } }

    before(:each) do
      picture_detail
      visit(edit_path)
      attach_file 'picture_gallery[append_assets][]', [Ecm::Galleries::Engine.root.join(*%w(spec files ecm galleries picture_details example.png))]
    end

    it { expect{ submit_button.click  }.to change{ resource.picture_details.count }.from(1).to(2) }
  end

  describe 'replacing picture details' do
    let(:base_path) { '/de/backend/bilder/picture_galleries' }
    let(:edit_path) { "#{base_path}/#{resource.to_param}/edit" }

    let(:picture_details) { create_list(:ecm_galleries_picture_detail, 2, picture_gallery: resource) }

    let(:submit_button) { within('form.edit_picture_gallery') { first('input[type="submit"]') } }

    before(:each) do
      picture_details
      visit(edit_path)
      attach_file 'picture_gallery[overwrite_assets][]', [Ecm::Galleries::Engine.root.join(*%w(spec files ecm galleries picture_details example.png))]
    end

    it { expect{ submit_button.click  }.to change{ resource.picture_details.count }.from(2).to(1) }
  end
end
