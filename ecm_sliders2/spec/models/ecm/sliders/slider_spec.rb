require 'spec_helper'

module Ecm
  module Sliders
    describe Slider do
      subject { FactoryGirl.create :ecm_sliders_slider }

      context "associations" do
        it { should have_many :ecm_sliders_items }
      end

      context 'auto_start' do
        it 'should respond to auto_start' do
          subject.should respond_to(:auto_start)
        end

        it 'should be equal to the initializer configuration' do
          slider = Ecm::Sliders::Slider.new
          slider.auto_start.should eq(Ecm::Sliders::Configuration.slider_auto_start)
        end
      end

      context "class methods" do
        context "#for_locale" do
          context "prefers local specific slider" do
            before(:each) do
              I18n.locale = :de
              @name = 'example'
              @slider    = FactoryGirl.create(:ecm_sliders_slider_with_items, :locale => nil, :name => @name)
              @de_slider = FactoryGirl.create(:ecm_sliders_slider_with_items, :locale => I18n.locale.to_s, :name => @name)
            end

            subject { Ecm::Sliders::Slider.where(:name => @name).for_locale(I18n.locale).first }

            it "should select the slider for the specific locale first" do
              subject.should eq(@de_slider)
            end
          end

          context "selects locale unspecific slider" do
            before(:each) do
              I18n.locale = :de
              @name = 'example'
              @slider = FactoryGirl.create(:ecm_sliders_slider_with_items, :locale => nil, :name => @name)
            end

            subject { Ecm::Sliders::Slider.where(:name => @name).for_locale(I18n.locale).first }

            it "should select the slider without locale when there is none with specific locale" do
              subject.should eq(@slider)
            end
          end
        end
      end

      context "friendly id" do
        subject { FactoryGirl.create(:ecm_sliders_slider, :name => 'Look, a slugged category!') }
        its(:to_param) { should eq('look-a-slugged-category') }
      end

      context 'interval' do
        it 'should respond to interval' do
          subject.should respond_to(:interval)
        end

        it 'should default to the settings in the initializer' do
          slider = Ecm::Sliders::Slider.new
          slider.interval.should eq(Ecm::Sliders::Configuration.slider_interval)
        end
      end

      context 'interval_in_milliseconds' do
        it 'should convert the interval value to milliseconds' do
          slider = Ecm::Sliders::Slider.new(:interval => 1.5)
          slider.interval_in_milliseconds.should eq(1500)
        end

        it 'should return an integer value' do
          slider = Ecm::Sliders::Slider.new(:interval => 1.5)
          slider.interval_in_milliseconds.should be_a(Integer)
        end
      end

      context "validations" do
        I18n.available_locales.map(&:to_s).each do |value|
          it { should allow_value(value).for(:locale) }
        end
        %w(some other values that are not allowed).each do |value|
          it { should_not allow_value(value).for(:locale) }
        end
        it { should validate_presence_of :name }
        it { should validate_uniqueness_of(:name).scoped_to(:locale) }
      end
    end
  end
end

