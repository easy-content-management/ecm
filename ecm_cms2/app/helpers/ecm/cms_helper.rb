module Ecm::CmsHelper
  # Example:
  #
  #     # This will render a bootstrap 4 compatible navigation
  #     = cms_render_navigation(
  #       :main,
  #       renderer: :list,
  #       container_css_class: 'navbar-nav',
  #       selected_class: 'active',
  #       item_html: { class: 'nav-item' },
  #       link_html: { class: 'nav-link' }
  #      )
  def cms_render_navigation(name, options = {})
    options.reverse_merge!(
      renderer:       :bootstrap,
      expand_all:     true,
      level:          1,
      selected_class: nil,
      item_html:      {},
      link_html:      {}
    )

    level               = options.delete(:level)
    expand_all          = options.delete(:expand_all)
    container_css_class = options.delete(:container_css_class)
    renderer            = options.delete(:renderer)
    selected_class      = options.delete(:selected_class)
    item_html           = options.delete(:item_html)
    link_html           = options.delete(:link_html)

    level_as_array = (level).is_a?(Range) ? level.to_a : [level]

    navigation = Ecm::Cms::Navigation.where(name: name.to_s, locale: I18n.locale.to_s).first
    if navigation.nil? && (locale = Ecm::Cms::Configuration.navigation_locale_fallback.call(name, I18n.locale))
      navigation = Ecm::Cms::Navigation.where(name: name.to_s, locale: locale).first
    end
    unless navigation
      return I18n.t('ecm.cms.navigation.messages.not_found', lang: I18n.locale.to_s, name: name.to_s)
    end

    roots = navigation.ecm_cms_navigation_items.roots.all
    if roots.empty?
      return I18n.t('ecm.cms.navigation.messages.empty', lang: I18n.locale.to_s, name: name)
    end

    render_navigation(level: level, expand_all: expand_all, renderer: renderer) do |navigation|
      navigation.dom_class = container_css_class
      navigation.selected_class = selected_class unless selected_class.nil?
      roots.each do |navigation_item|
        build_navigation_item(navigation, navigation_item, container_css_class, item_html, link_html)
      end
    end
  end

  def build_navigation_item(navigation, item, container_css_class, item_html = {}, link_html = {})
    options = {}
    options[:highlights_on] = /#{item.highlights_on}/ if item.highlights_on.present?
    options[:html] = item.li_attributes.marshal_dump.delete_if { |_key, value| value.blank? }

    options.reverse_merge!(html: item_html.dup, link_html: link_html)

    navigation.dom_class = container_css_class
    if item.children.present?
      navigation.item(item.key, item.name, item.url, options) do |sub_navigation|
        item.children.each do |sub_item|
          build_navigation_item(sub_navigation, sub_item, container_css_class, item_html, link_html)
        end
      end
    else
      navigation.item item.key, item.name, item.url, options
    end
  end

  def link_to_top
    render partial: '/ecm/cms/link_to_top'
  end

  def cms_page?
    params[:action] == 'respond' && params.has_key?(:page)
  end

  def current_cms_page?(page)
    cms_page? && params[:page].to_s == page.to_s
  end

  def current_cms_page
    cms_page? ? params[:page].to_s : nil
  end
end
