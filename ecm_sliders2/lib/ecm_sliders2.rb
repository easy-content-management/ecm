require 'acts_as_list'
require 'acts_as_markup'
require 'mini_magick'
require 'friendly_id'
require 'rao-view_helper'
require 'twitter-bootstrap-components-rails'
require 'ecm_core'

require 'ecm/sliders/engine'
require 'ecm/sliders/configuration'

module Ecm
  module Sliders
    extend Configuration

    def self.table_name_prefix
      'ecm_sliders_'
    end
  end
end
