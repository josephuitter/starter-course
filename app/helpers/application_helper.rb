module ApplicationHelper
	def login_helper style = ""
		if current_user.is_a?(GuestUser)
			(link_to "register", new_user_registration_path, class: style) +
  			" ".html_safe +
  			(link_to "login", new_user_session_path, class: style )
  		else 
  			link_to "logout", destroy_user_session_path, method: :delete, class: style 
  		end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from  #{session[:source]} and you are on the #{layout_name} layout"
	 		content_tag(:p, greeting, class: "source-greeting") 
	 	end
	end

  def nav_items
	[
		{
			url: root_path,
			title: 'home'
		},
		{
			url: about_path,
			title: 'about'
		},
		{
			url: contact_path,
			title: 'contact'
		},
		{
			url: blogs_path,
			title: 'blog'
		},
		{
			url: portfolios_path,
			title: 'portfolio'
		}								
  	]
  end	


  def nav_helper style, tag_type
  	nav_links = ""
  	nav_items.each do |item|
  	nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
  end	



		nav_links.html_safe

  end

  def active? path
  	"active" if current_page? path
  	
  end
  
  def copyright_generator
  	JosephViewTool::Renderer.copyright 'Joseph Uittermark', 'All Rights Reserved'
  end

  def alerts
	alert = (flash[:alert] || flash[:error] || flash[:notice])
    
    if alert
    	alert_generator alert
    end	
  end

  def alert_generator msg
  	js add_gritter(msg, title:  "", sticky: false)
  end

end






