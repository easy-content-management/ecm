require 'spec_helper'

describe "routing to sliders" do
  it "routes /ecm_sliders_sliders to index" do
    expect(:get => "/ecm_sliders_sliders").to route_to(
      :controller => "ecm/sliders/sliders",
      :action => "index"
    )
  end # it
end

