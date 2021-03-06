require 'rails_helper'
require 'ecm/user_area/spec_helpers/feature'

feature 'User Area -> Authentication' do
  include Ecm::UserArea::SpecHelpers::Feature

  background do
    I18n.locale = :de
  end

  describe 'sign in' do
    context 'with an existant user' do
      background do
        @user = Ecm::UserArea::CreateDefaultUserService.call.user
      end

      it 'should sign in' do
        sign_in(@user)
        expect(page.body).to include(I18n.t('messages.success.ecm_user_area.signed_in'))
      end
    end
  end

  describe 'sign out' do
    background do
      user = Ecm::UserArea::CreateDefaultUserService.call.user
      sign_in(user)
    end

    it 'should redirect to the home page' do
      click_link('Ausloggen')
      page.current_path.should eq('/de')
    end
  end # describe 'logout'
end
