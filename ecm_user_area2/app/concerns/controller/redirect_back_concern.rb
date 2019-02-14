module Controller
  module RedirectBackConcern
    extend ActiveSupport::Concern

    def store_location
      session[:original_location] = request.url if request.get?
    end

    def redirect_back_or(url)
      redirect_to(session[:original_location] || url)
      clear_return_to
    end

    def clear_return_to
      session.delete(:original_location)
    end
  end
end
