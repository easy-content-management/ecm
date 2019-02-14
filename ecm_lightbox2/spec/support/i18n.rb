class ActionView::TestCase::TestController
  def default_url_options(options={})
    { :i18n_locale => I18n.locale }
  end
end

class ActionDispatch::Routing::RouteSet
  def default_url_options(options={})
    { :i18n_locale => I18n.locale }
  end
end

class ActionController::TestCase
  module Behavior
    def process_with_default_locale(action, parameters = nil, session = nil, flash = nil, http_method = 'GET')
      parameters = { :i18n_locale => I18n.default_locale }.merge( parameters || {} )
      process_without_default_locale(action, parameters, session, flash, http_method)
    end
    alias_method_chain :process, :default_locale
  end
end

module ActionDispatch::Assertions::RoutingAssertions
  def assert_recognizes_with_default_locale(expected_options, path, extras={}, message=nil)
    expected_options = { :i18n_locale => I18n.default_locale.to_s }.merge( expected_options || {} )
    assert_recognizes_without_default_locale(expected_options, path, extras, message)
  end
  alias_method_chain :assert_recognizes, :default_locale
end

class ActionDispatch::Routing::RouteSet
  def url_for_with_locale_fix(options)
    url_for_without_locale_fix(options.merge(:i18n_locale => I18n.locale))
  end

  alias_method_chain :url_for, :locale_fix
end

