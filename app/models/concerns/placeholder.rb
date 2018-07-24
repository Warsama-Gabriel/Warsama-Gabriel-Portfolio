module Placeholder
	extend ActiveSupport::Concern #load in helper modules

	def self.image_generator(height:, width:) #pass in empyty key pair expects a hash
		"http://via.placeholder.com/#{height}x#{width}"
	end
end