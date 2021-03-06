class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :update, :edit, :create, :sort]}, site_admin: :all
  layout 'portfolio'
	
  def index
		@portfolio_items = Portfolio.by_position
	end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  render nothing: true
  end

  def python
    @python_portfolio_items = Portfolio.python
  end

	def new
    @portfolio_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
  	#performs the look up
    #this destroys the record
    #used has_many :technologies, dependent: :destroy in portfolio rb to fix error
    @portfolio_item.destroy
    
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The Record was successfully deleted.' }
    end
  end

  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name, :id, :_destroy])
  end
  
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end