require 'rails_helper'

RSpec.describe Ecm::Carousels::Carousel, type: :model do
  describe '#append_assets' do
    let(:original_assets) { [{ io: File.open(Ecm::Carousels::Engine.root.join(*%w(spec files ecm carousels item_details example.png))), filename: 'original.png' }] }
    let(:appended_assets) { [{ io: File.open(Ecm::Carousels::Engine.root.join(*%w(spec files ecm carousels item_details example.png))), filename: 'appended.png' }] }

    subject { create(:ecm_carousels_carousel) }

    before(:each) do
      subject.assets.attach(original_assets)
      subject.save!
      subject.append_assets = appended_assets
      subject.save!
    end
    it { expect(subject.assets.count).to eq(2) }
    it { expect(subject.item_details.count).to eq(2) }
    it { subject.item_details.each { |id| expect(id.asset).to be_present } }
  end
end