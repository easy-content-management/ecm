require 'spec_helper'

module Ecm
  module Sliders
    describe Item do
      subject { FactoryGirl.create :ecm_sliders_item }

      context "acts as list" do
        it { should respond_to(:move_to_top) }
        it { should respond_to(:move_higher) }
        it { should respond_to(:move_lower) }
        it { should respond_to(:move_to_bottom) }
      end

      context "acts as markup" do
        subject {
          Factory.create(:ecm_sliders_item, :body => "h1. This is a heading")
        }

        it { should validate_presence_of(:markup_language) }

        Ecm::Sliders::Configuration.markup_languages.each do |value|
          it { should allow_value(value).for(:markup_language) }
        end

        %w(some other values that are not allowed).each do |value|
          it { should_not allow_value(value).for(:markup_language) }
        end

        context "body.to_html" do
          specify { subject.body.to_html.should eq("<h1>This is a heading</h1>") }
        end
      end

      context "associations" do
        it { should belong_to :ecm_sliders_slider }
      end

      context "paperclip" do
        it { should respond_to :image }
      end

      context "validations" do
        it { should validate_presence_of(:ecm_sliders_slider) }
      end
    end
  end
end

