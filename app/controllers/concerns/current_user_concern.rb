module CurrentUserConcern
	extend ActiveSupport::Concern
	#null object pattern implemented
	#current_user is implemented by devise.
	#super call invokes parent method of the same name passing any
	#parameters that were passed to the current method


	def current_user
		super || guest_user
	end

	def guest_user
		OpenStruct.new(name: 'Guest User', first_name: 'Guest', last_name: 'User', email: 'guestuser@example.com')
	end
end