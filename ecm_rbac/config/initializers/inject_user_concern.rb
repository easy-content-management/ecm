Rails.configuration.to_prepare do
  begin
    puts "Including Model::Ecm::Rbac::UserConcern in #{Ecm::Rbac.user_class_name}"
    Ecm::Rbac.user_class_name.constantize.class_eval do
      include Model::Ecm::Rbac::UserConcern
    end
  rescue NameError => e
    "Could not include Model::Ecm::Rbac::UserConcern into #{Ecm::Rbac.user_class_name}. Error: #{e.message}"
  end
end