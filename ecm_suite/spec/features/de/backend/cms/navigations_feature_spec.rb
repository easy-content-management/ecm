require 'rails_helper'

RSpec.describe '/de/backend/cms/navigations', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Cms::Navigation }
  let(:resource) { create(:ecm_cms_navigation) }
  let(:resources) { create_list(:ecm_cms_navigation, 3) }

  it { resources; expect(subject).to implement_index_action(self) }

  it {
    expect(subject).to implement_create_action(self)
      .for(Ecm::Cms::Navigation)
      .within_form('#new_navigation') {
        select 'de', from: 'navigation[locale]'
        fill_in 'navigation[name]', with: 'main'
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
