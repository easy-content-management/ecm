require 'rails_helper'

RSpec.describe '/de/backend/cms/navigation_items', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:navigation) { create(:ecm_cms_navigation) }

  let(:resource_class) { Ecm::Cms::NavigationItem }
  let(:resource) { create(:ecm_cms_navigation_item) }
  let(:resources) { create_list(:ecm_cms_navigation_item, 3) }

  it { resources; expect(subject).to implement_index_action(self) }
  
  it {
    navigation
    expect(subject).to implement_create_action(self)
      .for(Ecm::Cms::NavigationItem)
      .within_form('#new_navigation_item') {
        select navigation.name, from: 'navigation_item[ecm_cms_navigation_id]'
        fill_in 'navigation_item[name]', with: 'Impressum'
        fill_in 'navigation_item[url]',  with: '/de/impressum'
        fill_in 'navigation_item[key]',  with: 'imprint'
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
