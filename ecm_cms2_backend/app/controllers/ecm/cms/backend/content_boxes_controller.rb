class Ecm::Cms::Backend::ContentBoxesController < Ecm::Core::Backend::ResourcesController::Base
  def self.resource_class
    Ecm::Cms::ContentBox
  end

  private

  def permitted_params
    params.require(:content_box).permit(:name)
  end
end
