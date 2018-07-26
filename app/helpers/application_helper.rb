module ApplicationHelper
	#html_safe => rails "scrubs" away the html just to return the inner string for protection

	def login_helper style=''
		#remove condition logic from the views! -->
    #user class can either be of class User or Openstruct -->

    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    else
      (link_to 'Register', new_user_registration_path, class: style) + " " +
      (link_to 'Login', new_user_session_path, class: style) 
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
end
