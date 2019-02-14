module ActiveAdmin::SignInHelper
  def sign_in(admin_user)
    post admin_user_session_path, {
      :admin_user => {
        :email    => admin_user.email,
        :password => admin_user.password
      }
    }
  end

  def sign_in_with(email, password)
    visit '/de/admin/login'
    fill_in 'admin_user[email]',    :with => email
    fill_in 'admin_user[password]', :with => password
    find(:xpath, '//input[@type="submit"]').click
  end
end if Object.const_defined?('ActiveAdmin')

