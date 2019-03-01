require 'rails_helper'

RSpec.describe '/de/backend/cms/pages', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Cms::Page}
  let(:resource) { create(:ecm_cms_page) }
  let(:resources) { create_list(:ecm_cms_page, 3) }

  it { resources; expect(subject).to implement_index_action(self) }
  
  it {
    expect(subject).to implement_create_action(self)
      .for(Ecm::Cms::Page)
      .within_form('#new_page') {
        fill_in 'page[title]',    with: 'Impressum'
        fill_in 'page[basename]', with: 'impressum'
      }
      .increasing{ |resource| resource.count }.by(1)
  }
  
  it { expect(subject).to implement_show_action(self).for(resource) }
  
  it {
    expect(subject).to implement_delete_action(self)
      .for(resource)
      .reducing{ resource_class.count }.by(1)
  }
end
