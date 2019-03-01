require 'spec_helper'

module Ecm
  module Carousels
    describe CarouselsController do
      describe "GET index" do
        before(:each) do
          @carousels = FactoryBot.create_list(:ecm_carousels_carousel, 2)
        end
        
        it "has a 200 status code" do
          get :index
          response.code.should eq("200")
        end

        it "assigns all ecm_carousels_carousels to @carousels" do
          get :index
          assigns(:carousels).should eq(@carousels)
        end
      end
    end
  end
end
