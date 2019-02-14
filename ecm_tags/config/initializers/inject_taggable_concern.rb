Rails.configuration.to_prepare do
  Ecm::Tags::Configuration.taggable_classes.each do |taggable|
    puts "Including Model::Ecm::Tags::TaggableConcern in #{taggable}"
    taggable.send(:include, Model::Ecm::Tags::TaggableConcern)
  end
end