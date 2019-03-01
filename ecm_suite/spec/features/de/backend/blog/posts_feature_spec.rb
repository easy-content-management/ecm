require 'rails_helper'

RSpec.describe '/de/backend/blog/posts', type: :feature do
  let(:user) { create(:ecm_user_area_user, :authenticable) }
  before(:each) { sign_in(user) }

  let(:resource_class) { Ecm::Blog::Post }
  let(:resource) { create(:ecm_blog_post) }
  let(:resources) { create_list(:ecm_blog_post, 3) }

  # List
  it { resources; expect(subject).to implement_index_action(self) }

  # Create
  it { 
    expect(subject).to implement_create_action(self)
      .for(resource_class)
      .within_form('#new_post') {
        # fill the needed form inputs via capybara here
        #
        # Example:
        #
        #     select 'de', from: 'slider[locale]'
        #     fill_in 'slider[name]', with: 'My first slider'
        #     check 'slider[auto_start]'
        #     fill_in 'slider[interval]', with: '3'
        fill_in 'post[title]', with: 'My first blog post'
        attach_file('post[assets][]', File.absolute_path(Ecm::Blog::Engine.root.join('spec', 'files', 'ecm', 'blog', 'asset', 'example.jpg')))
      }
      .increasing{ Ecm::Blog::Post.count }.by(1)
  }
  
  # Read
  it { expect(subject).to implement_show_action(self).for(resource) }

  # Update
  it {
    expect(subject).to implement_update_action(self)
      .for(resource)
      .within_form('.edit_post') {
        # fill the needed form inputs via capybara here
        # 
        # Example:
        # 
        #     fill_in 'slider[name]', with: 'New name'
        fill_in 'post[body]', with: 'Blah blah blah.'
      }
      .updating
      .from(resource.attributes)
      .to({ 'body' => 'Blah blah blah.' }) # Example: .to({ 'name' => 'New name' })
  }

  # Delete
  it {
    expect(subject).to implement_delete_action(self)
      .for(resource)
      .reducing{ resource_class.count }.by(1)
  }
end
