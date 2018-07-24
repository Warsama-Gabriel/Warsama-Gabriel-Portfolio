module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_title
	end

	def set_title
		#set default title
		@page_title = 'Devcamp Portfolio | WG Portfolio'
		@seokeywords = 'Warsama Gabriel Portfolio'
	end
end