require 'rails_helper'

RSpec.describe '/de/backend/carousels/carousels', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Carousels::Carousel }
  let(:resource) { create(:ecm_carousels_carousel) }
  let(:resources) { create_list(:ecm_carousels_carousel, 3) }

  it { resources; expect(subject).to implement_index_action(self) }

  it { 
    expect(subject).to implement_create_action(self)
      .for(Ecm::Sliders::Slider)
      .within_form('#new_carousel') {
        select 'de', from: 'carousel[locale]'
        fill_in 'carousel[name]', with: 'My first carousel'
        check 'carousel[auto_start]'
        fill_in 'carousel[interval]', with: '3'
      }
      .increasing{ Ecm::Sliders::Slider.count }.by(1)
  }
  
  it { expect(subject).to implement_show_action(self).for(resource) }

  it {
    expect(subject).to implement_update_action(self)
      .for(resource)
      .within_form('.edit_carousel') {
        fill_in 'carousel[name]', with: 'New name'
      }
      .updating
      .from(resource.attributes)
      .to({ 'name' => 'New name' })
  }

  it {
    expect(subject).to implement_delete_action(self)
      .for(resource)
      .reducing{ resource_class.count }.by(1)
  }
end
