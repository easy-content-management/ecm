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
      .for(Ecm::Carousels::Carousel)
      .within_form('#new_carousel') {
        select 'de', from: 'carousel[locale]'
        fill_in 'carousel[identifier]', with: 'main'
      }
      .increasing{ Ecm::Carousels::Carousel.count }.by(1)
  }
  
  it { expect(subject).to implement_show_action(self).for(resource) }

  it {
    expect(subject).to implement_update_action(self)
      .for(resource)
      .within_form('.edit_carousel') {
        fill_in 'carousel[identifier]', with: 'secondary'
      }
      .updating
      .from(resource.attributes)
      .to({ 'identifier' => 'secondary' })
  }

  it {
    expect(subject).to implement_delete_action(self)
      .for(resource)
      .reducing{ resource_class.count }.by(1)
  }

  describe 'appending item details' do
    let(:base_path) { '/de/backend/carousels/carousels' }
    let(:edit_path) { "#{base_path}/#{resource.to_param}/edit" }

    let(:item_detail) { create(:ecm_carousels_item_detail, carousel: resource) }

    let(:submit_button) { within('form.edit_carousel') { first('input[type="submit"]') } }

    before(:each) do
      item_detail
      visit(edit_path)
      attach_file 'carousel[append_assets][]', [Ecm::Carousels::Engine.root.join(*%w(spec files ecm carousels item_details example.png))]
    end

    it { expect{ submit_button.click  }.to change{ resource.item_details.count }.from(1).to(2) }
  end

  describe 'replacing item details' do
    let(:base_path) { '/de/backend/carousels/carousels' }
    let(:edit_path) { "#{base_path}/#{resource.to_param}/edit" }

    let(:item_details) { create_list(:ecm_carousels_item_detail, 2, carousel: resource) }

    let(:submit_button) { within('form.edit_carousel') { first('input[type="submit"]') } }

    before(:each) do
      item_details
      visit(edit_path)
      attach_file 'carousel[overwrite_assets][]', [Ecm::Carousels::Engine.root.join(*%w(spec files ecm carousels item_details example.png))]
    end

    it { expect{ submit_button.click  }.to change{ resource.item_details.count }.from(2).to(1) }
  end
end
