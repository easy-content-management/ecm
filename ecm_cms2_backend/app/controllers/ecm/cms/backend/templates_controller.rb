class Ecm::Cms::Backend::TemplatesController < Ecm::Core::Backend::ResourcesController::Base
  def self.resource_class
    Ecm::Cms::Template
  end

  private

  def permitted_params
    params.require(:template)
          .permit(:body, :pathname, :basename, :locale, :format, :handler)
  end
end
