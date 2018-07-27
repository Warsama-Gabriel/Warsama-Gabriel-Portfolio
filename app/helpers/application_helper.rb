module ApplicationHelper
	#html_safe => rails "scrubs" away the html just to return the inner string for protection

	def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

	def source_helper
	 if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]}", class: "source-greeting")
    end
	end


  def set_copyright
    WGViewTool::Renderer.copyright('Warsama Gabriel', 'All rights reserved')
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end



  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    puts nav_links
    nav_links.html_safe #interpret the html before rendering it on the screen.
  end

  def active? path
    "active" if current_page?(path)
  end
end
