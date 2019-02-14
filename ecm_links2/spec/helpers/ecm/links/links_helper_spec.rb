require 'rails_helper'

module Ecm
  module Links
    describe LinksHelper do
      describe '#render_link' do
        before(:each) do
          @link = FactoryGirl.create(:ecm_links_link)
        end

        subject { helper.render_link(@link) }

        it { should have_link(@link.name, href: @link.url) }
      end
    end
  end
end
