module CurrentUserConcern
	extend ActiveSupport::Concern
	#null object pattern implemented
	#current_user is implemented by devise.
	#super call invokes parent method of the same name passing any
	#parameters that were passed to the current method
	#guest user now inherits from devise User object


	def current_user
		super || guest_user
	end

	def guest_user
		guest_user = GuestUser.new
		guest_user.name = "Guest User"
		guest_user.first_name = "Guest"
		guest_user.last_name = "User"
		guest_user.email = "guest@example.com"
		guest_user
	end
end