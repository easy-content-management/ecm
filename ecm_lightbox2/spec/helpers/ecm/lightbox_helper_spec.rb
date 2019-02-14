require 'rails_helper'

RSpec.describe Ecm::LightboxHelper do
  describe '#modal_gallery' do
    subject { Capybara::Node::Simple.new(helper.modal_gallery) }

    it { expect(subject).to have_xpath("//div[@id='blueimp-gallery']") }
  end
end