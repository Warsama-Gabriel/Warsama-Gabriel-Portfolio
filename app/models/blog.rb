class Blog < ApplicationRecord
	extend FriendlyId

	validates :title, presence: true

	friendly_id :title, use: :slugged

	enum post_status: { draft: 0, published: 1 } #enums are key value pairs that represent data state
	#enums give a ? method for db querying.
	#belongs_to :topic

end
