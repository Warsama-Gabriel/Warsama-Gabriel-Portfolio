class Portfolio < ApplicationRecord

	has_many :technologies
	#accepts_nested_attributes_for allows us to save parent and child model all in one go.
	#creates fields_for builder in our forms
	#passing in a set of key value pairs in the technologies attributes as an array of hashes.
	accepts_nested_attributes_for :technologies, 
																allow_destroy: true,
								   							reject_if: lambda {|attrs| attrs['name'].blank? }

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	validates_presence_of :title, :body


	def self.angular
		where(subtitle: 'Angular')
	end


	def self.by_position
		order(:position)
	end

	scope :ruby_on_rails_items, -> { where(subtitle: 'Ruby on Rails')}

end
