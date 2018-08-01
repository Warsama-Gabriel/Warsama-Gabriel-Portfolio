module PortfoliosHelper

	def portfolio_img img=nil, type
		case type
			when 'thumb'
				height = 350
				width = 250
			when 'main'
				height = 600
				width = 400
		end
		
		if img.present?
			image_tag(img, size: "#{height}x#{width}")
		else
			image_tag("http://placehold.it/#{height}x#{width}")
		end
	end
end


