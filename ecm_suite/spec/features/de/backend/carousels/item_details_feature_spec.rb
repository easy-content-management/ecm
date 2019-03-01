require 'rails_helper'

RSpec.describe '/de/backend/carousels/item_details', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:carousel) { create(:ecm_carousels_carousel) }

  let(:resource_class) { Ecm::Sliders::ItemDetail }
  let(:resource) { create(:ecm_carousels_item_detail) }
  let(:resources) { create_list(:ecm_carousels_item_detail, 3) }

  it { resources; expect(subject).to implement_index_action(self) }

  it { 
    carousel
    expect(subject).to implement_create_action(self)
      .for(resource_class)
      .within_form('#new_item_detail') {
        select carousel.name, from: 'item_detail[carousel_id]'
        attach_file 'item_detail[image]', Ecm::Sliders::Engine.root.join(*%w(spec files ecm carousels item_details example.png))
        select 'textile', from: 'item_detail[markup_language]'
      }
      .increasing{ resource_class.count }.by(1)
  }

  it { expect(subject).to implement_show_action(self).for(resource) }
  
  it {
    expect(subject).to implement_update_action(self)
      .for(resource)
      .within_form('.edit_item_detail') {
        fill_in 'item_detail[body]', with: 'New body'
      }
      .updating
      .from(resource.attributes)
      .to({ 'body' => 'New body' })
  }

  it {
    expect(subject).to implement_delete_action(self)
      .for(resource)
      .reducing{ resource_class.count }.by(1)
  }
end