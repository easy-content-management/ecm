require 'spec_helper'

module Ecm
  module Sliders
    describe SlidersController do
      describe "GET index" do
        before(:each) do
          @sliders = FactoryGirl.create_list(:ecm_sliders_slider, 2)
        end
        
        it "has a 200 status code" do
          get :index
          response.code.should eq("200")
        end

        it "assigns all ecm_sliders_sliders to @sliders" do
          get :index
          assigns(:sliders).should eq(@sliders)
        end
      end
    end
  end
end
