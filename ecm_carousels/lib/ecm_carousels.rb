require 'acts_as_list'
require 'acts_as_markup'
require 'mini_magick'
# require 'friendly_id'
require 'rao-view_helper'
# require 'twitter-bootstrap-components-rails'
require 'ecm_core'

require 'ecm/carousels/engine'
require 'ecm/carousels/configuration'

module Ecm
  module Carousels
    extend Configuration

    def self.table_name_prefix
      'ecm_carousels_'
    end
  end
end
