require "ecm"
 
%w(
  ecm_blog
  ecm_blog_backend
  ecm_carousels
  ecm_carousels_backend
  ecm_cms2
  ecm_cms2_backend
  ecm_contact2
  ecm_contact2_backend
  ecm_files
  ecm_files_backend
  ecm_galleries
  ecm_galleries_backend
  ecm_links2
  ecm_links2_backend
  ecm_rbac
  ecm_rbac_backend
  ecm_tags
  ecm_tags_backend
  ecm_user_area2
  ecm_user_area2_backend
).each do |engine|
  begin
    require engine
  rescue LoadError
  end
end