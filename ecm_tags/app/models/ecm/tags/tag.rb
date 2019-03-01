module Ecm::Tags
  class Tag < ActsAsTaggableOn::Tag
    self.table_name = 'tags'
  end
end
