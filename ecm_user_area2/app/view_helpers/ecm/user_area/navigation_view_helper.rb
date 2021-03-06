module Ecm
  module UserArea
    class NavigationViewHelper < Rao::ViewHelper::Base
      def render(options = {})
        options.reverse_merge!(dropdown: false, bootstrap_version: 4)
        
        bootstrap_version = options.delete(:bootstrap_version)

        send("render_with_bootstrap_#{bootstrap_version}", options)
      end

      private

      def render_with_bootstrap_3(options)
        dropdown = options.delete(:dropdown)
        if dropdown
          c.render partial: "ecm/user_area/navigation_view_helper/bootstrap_3/render_dropdown"
        else
          c.render partial: "ecm/user_area/navigation_view_helper/bootstrap_3/render"
        end
      end

      def render_with_bootstrap_4(options)
        dropdown = options.delete(:dropdown)
        if dropdown
          c.render partial: "ecm/user_area/navigation_view_helper/bootstrap_4/render_dropdown"
        else
          c.render partial: "ecm/user_area/navigation_view_helper/bootstrap_4/render"
        end
      end
    end
  end
end
