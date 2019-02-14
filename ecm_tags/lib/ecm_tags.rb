require 'acts-as-taggable-on'
require 'haml-rails'
require 'responders'
require 'simple_form'

require 'ecm/tags'
require 'ecm/tags/engine'

require 'acts_as_taggable_on/tag'
module ActsAsTaggableOn
  class Tag
    self.table_name = 'ecm_tags_tags'
  end
end

require 'acts_as_taggable_on/tagging'
module ActsAsTaggableOn
  class Tagging
    self.table_name = 'ecm_tags_taggings'
  end
end
