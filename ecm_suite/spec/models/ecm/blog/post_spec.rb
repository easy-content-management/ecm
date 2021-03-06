require 'rails_helper'

RSpec.describe Ecm::Blog::Post, type: :model do
  before(:each) { ActiveStorage::Attachment.destroy_all; ActiveStorage::Blob.destroy_all; }

  describe 'assets' do
    let(:assets) {[
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'},
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'}
    ]}

    subject { build(:ecm_blog_post) }

    before(:each) { subject.save }

    it { expect{  subject.append_assets = assets; subject.save }.to change { Ecm::Blog::AssetDetail.count }.from(0).to(2) }
    it { expect{  subject.append_assets = assets; subject.save }.to change { ActiveStorage::Attachment.count }.from(0).to(2) }
  end

  describe 'appending assets' do
    let(:original_assets) {[
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'},
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'}
    ]}

    let(:new_assets) {[
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'}
    ]}

    subject { build(:ecm_blog_post, assets: original_assets) }

    before(:each) { subject.save }

    it { expect{ subject.append_assets = new_assets; subject.save }.to change { Ecm::Blog::AssetDetail.count }.from(2).to(3) }
    it { expect{ subject.append_assets = new_assets; subject.save }.to change { ActiveStorage::Attachment.count }.from(2).to(3) }
  end

  describe 'overwriting assets' do
    let(:original_assets) {[
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'},
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'}
    ]}

    let(:new_assets) {[
      { io: File.open(Ecm::Blog::Engine.root.join(*%w(spec files ecm blog asset example.jpg))), filename: 'example.jpg'}
    ]}

    subject { build(:ecm_blog_post, assets: original_assets) }

    before(:each) { subject.save }

    it { expect{ subject.overwrite_assets = new_assets; subject.save }.to change { Ecm::Blog::AssetDetail.count }.from(2).to(1) }
    it { expect{ subject.overwrite_assets = new_assets; subject.save }.to change { ActiveStorage::Attachment.count }.from(2).to(1) }
  end
end