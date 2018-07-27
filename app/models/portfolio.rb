class Portfolio < ApplicationRecord

	has_many :technologies
	#accepts_nested_attributes_for allows us to save parent and child model all in one go.
	#creates fields_for builder in our forms
	#passing in a set of key value pairs in the technologies attributes as an array of hashes.
	accepts_nested_attributes_for :technologies, 
								   reject_if: lambda {|attrs| attrs['name'].blank? }

	include Placeholder

	validates :title, :body, :main_image, :thumb_image , presence: true

	def self.angular
		where(subtitle: 'Angular')
	end


	def self.by_position
		order(:position)
	end

	scope :ruby_on_rails_items, -> { where(subtitle: 'Ruby on Rails')}

	after_initialize :set_defaults
	#after new is called set defaults.

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
		self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
	end
end
