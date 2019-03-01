require 'spec_helper'

describe "routing to carousels" do
  it "routes /ecm_carousels_carousels to index" do
    expect(:get => "/ecm_carousels_carousels").to route_to(
      :controller => "ecm/carousels/carousels",
      :action => "index"
    )
  end # it
end

