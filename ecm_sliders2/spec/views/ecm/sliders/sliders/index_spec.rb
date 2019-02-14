require 'spec_helper'

describe "ecm/sliders/sliders/index" do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end
  
  it "renders _slider partial for each slider" do
    @sliders = FactoryGirl.create_list(:ecm_sliders_slider, 2)
    assign(:sliders, @sliders)
    render
    @sliders.map(&:ecm_sliders_items).flatten.each do |item| 
      rendered.should have_content(mu(item, :body))
    end  
  end
end
