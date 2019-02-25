module Ecm
  module Blog
    module ApplicationHelper
      # Prerequisites:
      # 
      # You have to add the simple-navigation gem to your Gemfile:
      # 
      #     # Gemfile
      #     gem 'simple-navigation'
      #
      # Usage:
      #
      #     # app/controllers/application_controller.rb
      #     class ApplicationController < ActionController::Base
      #       helper Ecm::Blog::ApplicationHelper
      #     end
      #
      #     # app/views/layouts/application.html.haml
      #     = blog_render_monthly_navigation if controller.class.name.deconstantize == 'Ecm::Blog'
      #
      def blog_render_monthly_navigation
        posts = Ecm::Blog::Post.published.all.pluck(:created_at)
        posts_by_month = posts.group_by {|t| t.beginning_of_month }
        render partial: 'ecm/blog/posts/monthly_navigation', locals: { posts_by_month: posts_by_month}
      end
    end
  end
end
