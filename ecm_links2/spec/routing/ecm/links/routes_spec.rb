require 'rails_helper'

describe 'routing to categories' do
  it 'routes /ecm_links_categories to index' do
    expect(get: '/ecm_links_categories').to route_to(
      controller: 'ecm/links/categories',
      action: 'index'
    )
  end

  it 'routes /ecm_links_categories/1 to show with id 1' do
    expect(get: '/ecm_links_categories/1').to route_to(
      controller: 'ecm/links/categories',
      action: 'show',
      id: '1'
    )
  end
end
