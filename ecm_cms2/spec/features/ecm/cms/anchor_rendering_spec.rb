require 'rails_helper'

describe 'Anchor rendering via additional content' do
  before(:each) do
    @page = create(:ecm_cms_page, pathname: '/', basename: 'home', locale: I18n.locale, handler: 'erb', format: 'html')
    visit "/#{I18n.locale}"
  end

  it { expect(page).to have_css('a#top-link') }
end
