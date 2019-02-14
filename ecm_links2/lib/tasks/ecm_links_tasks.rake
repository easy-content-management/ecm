namespace :ecm_links do
  namespace :db do
    desc 'Purges and creates example data'
    task :populate!, [] => [:environment] do |_t, _args|
      Rake::Task['ecm_links:db:clear!'].execute
      Rake::Task['ecm_links:db:populate'].execute
    end

    desc 'Clears all data!'
    task :clear!, [] => [:environment] do |_t, _args|
      Ecm::Links::Category.delete_all
      Ecm::Links::Link.delete_all
    end

    desc 'Creates example_data'
    task :populate, [] => [:environment] do |_t, _args|
      require 'ffaker'
      require 'forgery'

      # Create example categories
      5.times do
        Ecm::Links::Category.create! do |c|
          c.locale = I18n.available_locales.map(&:to_s).choice
          c.name = "#{Faker::Company.name} Category"
          c.link_footer_column = [nil, 1, 2, 3, 4].choice
        end
      end

      50.times do
        Ecm::Links::Category.create! do |c|
          c.parent = Ecm::Links::Category.all.choice
          c.name = "#{Faker::Company.name} Category"
          c.link_footer_column = [nil, 1, 2, 3, 4].choice
        end
      end

      # Create example links
      categories = Ecm::Links::Category.all
      50.times do
        Ecm::Links::Link.create! do |l|
          l.name = "#{Faker::Company.name} Link"
          l.url = "#{Faker::Internet.http_url} Link"
          l.description = Faker::Lorem.paragraph(rand(3))
          l.ecm_links_category = categories.choice
        end
      end
    end
  end
end
