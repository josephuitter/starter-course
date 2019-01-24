 module DefaultPageContent
 	extend ActiveSupport::Concern
 
 included do
 	before_action :set_page_defaults
 end

  def set_page_defaults
  	@page_title = " Starting Project|My Portfolio Website"
  	@seo_keywords = "joseph starter portfolio"
 
  end
end