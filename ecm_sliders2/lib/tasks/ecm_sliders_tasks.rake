namespace :ecm do
  namespace :sliders do
    namespace :db do
      desc "Purges and creates example data"
      task :populate!, [] => [:environment] do |t, args|
        Rake::Task["ecm:sliders:db:clear!"].execute
        Rake::Task["ecm:sliders:db:populate"].execute
      end

      desc "Clears all data!"
      task :clear!, [] => [:environment] do |t, args|
        Rake::Task["ecm:sliders:db:clear_sliders!"].execute
        Rake::Task["ecm:sliders:db:clear_items!"].execute
      end

      desc "Clears all sliders!"
      task :clear_sliders!, [] => [:environment] do |t, args|
        Ecm::Sliders::Slider.delete_all
      end

      desc "Clears all items!"
      task :clear_items!, [] => [:environment] do |t, args|
        Ecm::Sliders::Item.delete_all
      end

      desc "Creates example data"
      task :populate, [] => [:environment] do |t, args|
        Rake::Task["ecm:sliders:db:populate_sliders"].execute
        Rake::Task["ecm:sliders:db:populate_items"].execute
      end

      desc "Creates example data for sliders"
      task :populate_sliders, [] => [:environment] do |t, args|
        5.times do |i|
          Ecm::Sliders::Slider.create! do |s|
            s.name = "Slider Gallery #{i}"
          end

          I18n.available_locales.each do |locale|
            Ecm::Sliders::Slider.create! do |s|
              s.name = "Slider Gallery #{i}"
              s.locale = locale.to_s
            end if (rand(3) == 0)
          end
        end
      end

      desc "Creates example data for items"
      task :populate_items, [] => [:environment] do |t, args|
        require "ffaker"
        require "forgery"

        sliders = Ecm::Sliders::Slider.all
        50.times do
          Ecm::Sliders::Item.create! do |i|
            i.ecm_sliders_slider = sliders.choice
            i.image = File.open(File.join(Ecm::Sliders::Engine.root, 'spec/files', 'ecm/sliders/items', 'example.png'))
            i.body = Faker::Lorem.paragraph(rand(3)) if (rand(4) != 0)
            i.url = Faker::Internet.http_url if (rand(2) == 0)
          end
        end
      end
    end
  end
end


