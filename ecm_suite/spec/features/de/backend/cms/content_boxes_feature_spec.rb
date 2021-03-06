require 'rails_helper'

RSpec.describe '/de/backend/cms/content_boxes', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Cms::ContentBox }
  let(:resource) { create(:ecm_cms_content_box) }
  let(:resources) { create_list(:ecm_cms_content_box, 3) }

  it { resources; expect(subject).to implement_index_action(self) }
  
  it {
    expect(subject).to implement_create_action(self)
      .for(Ecm::Cms::ContentBox)
      .within_form('#new_content_box') {
        fill_in 'content_box[name]', with: 'My first content box'
      }
      .increasing{ |resource| resource.count }.by(1)
  }

  it { expect(subject).to implement_show_action(self).for(resource) }
  
  it {
    expect(subject).to implement_update_action(self)
      .for(resource)
      .within_form('.edit_content_box') {
        fill_in 'content_box[name]', with: 'This is a fancy new Name'
      }
      .updating
      .from(resource.attributes)
      .to({ 'name' => 'This is a fancy new Name' })
  }
  
  it { 
    expect(subject).to implement_delete_action(self)
      .for(resource)
      .reducing{ resource_class.count }.by(1)
  }
end
