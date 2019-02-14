module Ecm::Cms
  class AddHomepagesService < Rao::Service::Base
    class Result < Rao::Service::Result::Base
    end
    
    attr_accessor :locales

    validates :locales, presence: true

    def initialize(attributes = {}, options = {})
      attributes.reverse_merge!({ locales: I18n.available_locales })
      attributes[:locales].try(:reject!, &:blank?)

      super(attributes, options)

      @all_pages              = []
      @already_existent_pages = []
      @failed_pages           = []
      @created_pages          = []
    end

    def _perform
      say "Environment: #{Rails.env}"
      create_homepages
      warn("Skipped #{@already_existent_pages.size} already existent pages for locales: #{@already_existent_pages.map(&:locale).join(', ')}", indent: 1) if @already_existent_pages.any?
      info("Added #{@created_pages.size} new home pages for locales: #{@created_pages.map(&:locale).join(', ')}", indent: 1)
      warn("Failed adding #{@failed_pages.size} new home pages for locales: #{@failed_pages.map(&:locale).join(', ')}", indent: 1) if @failed_pages.any?

    end

    private

    def warn(message)
      say(message)
    end

    def info(message)
      say(message)
    end

    def create_homepages
      @all_pages = @locales.collect do |locale|
        say "Adding homepage for locale #{locale}", indent: 1
        page = Ecm::Cms::Page.where(locale: locale, pathname: '/', basename: 'home', handler: 'textile').first_or_initialize
        unless page.new_record?
          @already_existent_pages << page
          warn "already exists", indent: 2
          next page
        end 
        page.tap do |page|
          page.title            = "Homepage (#{locale})"
          page.meta_description = 'home'
          page.body             = "h1. Homepage (#{locale})"
          page.pathname         = '/'
          page.basename         = 'home'
          page.locale           = locale
          page.handler          = 'textile'
        end
        if page.save
          @created_pages << page
          info "done", indent: 1
        else
          @failed_pages << page
          errors << page.errors
          warn "could not save page. errors: #{page.errors.full_messages.to_sentence}"
        end
        page
      end
    end
  end
end
