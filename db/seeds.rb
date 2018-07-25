3.times do |topic|
	Topic.create!(
			title: "Topic #{topic}"

	)
end


puts  "3 topics created"


10.times do |blog|
	Blog.create!(
		title: "My blog post is #{blog}",
		body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
		topic_id: Topic.last.id
	)

end


puts "10 blog items created."


9.times do |skill_item|
	Skill.create!(
		title: "Rails #{skill_item}",
		percent_utilized: 15
	)
end

puts "5 skills created."



8.times do |portfolio_item|
	Portfolio.create!(

		title: "Portfolio title: #{portfolio_item}", 
		subtitle: "Ruby on Rails",
		body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
		main_image: 'http://via.placeholder.com/600x400',
		thumb_image: 'http://via.placeholder.com/350x200'
	)
end

1.times do |portfolio_item|
	Portfolio.create!(

		title: "Portfolio title: #{portfolio_item}", 
		subtitle: "Angular",
		body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
		main_image: 'http://via.placeholder.com/600x400',
		thumb_image: 'http://via.placeholder.com/350x200'
	)
end

puts "9 portfolio items created."


3.times do |technology_item|
	Portfolio.last.technologies.create!(
		name: "Technology #{technology_item}"
	)
end

puts "3 technologies created"








