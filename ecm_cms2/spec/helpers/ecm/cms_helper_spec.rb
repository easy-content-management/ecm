require 'rails_helper'

module Ecm
  describe CmsHelper do
    describe '#cms_render_navigation' do
      it 'shows an warning on missing navigation' do
        name = 'main'
        expect(helper.cms_render_navigation(name)).to eq(I18n.t('ecm.cms.navigation.messages.not_found', lang: I18n.locale.to_s, name: name.to_s))
      end

      it 'shows an warning on empty navigation' do
        name = 'main'
        navigation = FactoryGirl.create :ecm_cms_navigation, name: name, locale: I18n.locale.to_s
        expect(helper.cms_render_navigation(name)).to eq(I18n.t('ecm.cms.navigation.messages.empty', lang: I18n.locale.to_s, name: name.to_s))
      end

      it 'renders the navigation' do
        name = 'main'
        navigation = FactoryGirl.create :ecm_cms_navigation, name: name, locale: I18n.locale.to_s
        items = [
          { ecm_cms_navigation: navigation, name: 'Home', url: "/#{I18n.locale}/", key: 'home', options: nil },
          { ecm_cms_navigation: navigation, name: 'About us', url: "/#{I18n.locale}/about-us", key: 'about_us', options: nil },
          { ecm_cms_navigation: navigation, name: 'Approach', url: "/#{I18n.locale}/approach", key: 'approach', options: nil },
          { ecm_cms_navigation: navigation, name: 'Contact', url: "/#{I18n.locale}/contact", key: 'contact', options: nil }
        ]
        Ecm::Cms::NavigationItem.create(items)
        items.each do |i|
          expect(helper.cms_render_navigation(name)).to match /#{i[:name]}/
        end
      end

      describe 'options' do
        before(:each) do
          @navigation = FactoryGirl.create(:ecm_cms_navigation, locale: I18n.locale)
          @items = [FactoryGirl.create(:ecm_cms_navigation_item, ecm_cms_navigation: @navigation, data_add_icon: 'foo')]
        end

        it 'should be rendered' do
          expect(helper.cms_render_navigation(@navigation.name)).to match /foo/
        end
      end
    end
  end
end
