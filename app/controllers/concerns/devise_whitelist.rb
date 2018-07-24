#convention is module_name
#module ModuleName
module DeviseWhitelist
	extend ActiveSupport::Concern

	#include the before action thanks to active_support_concern.
	#beforefilter, before any controller run this code
	#if devise_controller? is the request from the browser going to a devise controller?
	included do
		before_action :configure_permitted_parameters, if: :devise_controller?
	end

	def configure_permitted_parameters
		#allow custom fields
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #sign up action
		devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #edit account action
	end
end