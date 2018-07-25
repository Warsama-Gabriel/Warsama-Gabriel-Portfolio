class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: [:edit, :show, :update, :destroy]
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :edit, :create, :update]}, siteadmin: :all
	
	layout 'portfolio'
	
	def index
		@portfolio_items = Portfolio.all
	end
	def angular
		@portfolio_items = Portfolio.angular
	end

	def new
		@portfolio = Portfolio.new
		#instantiate portfolio item technologies
		3.times { @portfolio.technologies.build }
	end

	def edit
		#3.times { @portfolio.technologies.build }
	end

	def show
		
	end

	def create
		@portfolio = Portfolio.new(portfolio_params) #check against technology attribute in the technology table. 

		respond_to do |f|
			if @portfolio.save
				f.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.'}
			else

			end
		end
	end

	def update
	    respond_to do |format|
	      if @portfolio.update(portfolio_params)
	        format.html { redirect_to @portfolio, notice: 'Item successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
	end


	def destroy
		@portfolio.destroy
	    respond_to do |format|
	      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
	    end
	end

	private

	def set_portfolio
		@portfolio = Portfolio.find(params[:id])
	end

	def portfolio_params
		params.require(:portfolio).permit(:title, 
										  :subtitle, 
										  :body,
										  technologies_attributes: [:name]
										  )
	end
 end
