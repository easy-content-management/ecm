require 'rails_helper'

RSpec.describe '/de/backend/kontakt/contact_requests', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Contact::ContactRequest }
  let(:resource) { create(:ecm_contact_contact_request) }
  let(:resources) { create_list(:ecm_contact_contact_request, 3) }

  # List
  it { resources; expect(subject).to implement_index_action(self) }
  
  # Read
  it { expect(subject).to implement_show_action(self).for(resource) }
end
