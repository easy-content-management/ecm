class Ecm::Cms::PageController < Ecm::Cms::Configuration.base_controller.constantize
  # add the page resolver
  include Ecm::Cms::ControllerExtensions::PageResolver
  include Ecm::Cms::ControllerExtensions::PartialResolver

  # avoid error 500 on missing template
  rescue_from ActionView::MissingTemplate do
    if params[:page] == 'home'
      render_fallback_page
    else
      respond_to do |format|
        format.html do
          render(file: "#{Rails.root}/public/404", formats: [:html],
                 layout: false,
                 status: 404
                )
        end
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end
  end

  def respond
    respond_to do |format|
      format.html { render template: params[:page] }
      format.txt  { render template: params[:page], layout: false, formats: [:text] }
      format.pdf do
        output = render_to_string template: params[:page], formats: [:html, :pdf], layout: false
        self.response_body = WickedPdf.new.pdf_from_string(output)
      end if Gem::Specification.find_all_by_name('wicked_pdf').any?
    end
  end

  private

  def render_fallback_page
    respond_to do |format|
      format.html { render :fallback }
      format.txt  { render :fallback }
    end
  end
end
