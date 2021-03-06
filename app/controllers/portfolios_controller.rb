class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: [:edit, :show, :update, :destroy]
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :edit, :create, :update, :sort]}, siteadmin: :all
	
	layout 'portfolio'
	
	def index
		@portfolio_items = Portfolio.by_position
	end

	def sort
		params[:order].each do |key,val|
			Portfolio.find(val[:id]).update(position: val[:position])
		end

		#by pass rails view rendering
		render body: nil
	end
	def angular
		@portfolio_items = Portfolio.angular
	end

	def new
		@portfolio = Portfolio.new
	end

	def edit
	end

	def show
		
	end

	def create
		@portfolio = Portfolio.new(portfolio_params) #check against technology attribute in the technology table. 

		respond_to do |format|
			if @portfolio.save
				format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.'}
			else
				format.html { render :new }
			end
		end
	end

	def update
	  respond_to do |format|
	    if @portfolio.update(portfolio_params)
	      format.html { redirect_to portfolio_show_path(@portfolio), notice: 'Item successfully updated.' }
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
									  :main_image,
									  :thumb_image,
									  technologies_attributes: [:id, :name, :_destroy]
									)
	end
 end
