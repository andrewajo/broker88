class CarriersController < ApplicationController
	def index
		@page = params[:page] ? params[:page] : 1

		@search = Carrier.order_by([:name, :asc]).any_of({:name => Regexp.new("^#{params[:search]}.*", true)}, {:mc_number => Regexp.new("#{params[:search]}.*", true)})
		if @search.count > 0  && params[:search]
			@carrier = @search.first
			@carriers = []
			@carriers += Carrier.where(:name.lt => @carrier.name).order_by([:name, :desc]).limit(7).reverse
			@carriers << @carrier
			@carriers += Carrier.where(:name.gt => @carrier.name).order_by([:name, :asc]).limit(7)
		else
			@carriers = Carrier.order_by([:name, :asc]).page
		end
	end

	def new
		@page = params[:page] ? params[:page] : 1
		@carriers = Carrier.page
		@carrier = Carrier.new
	end

	def show
		@page = params[:page] ? params[:page] : 1
		@carriers = Carrier.page
		@carrier = Carrier.find(params[:id])
	end

	def create
		@carrier = Carrier.new(params[:carrier])

		if @carrier.save
			redirect_to carriers_path, notice: 'Carrier successfully created!'
		else
			render :action => 'new'
		end
	end

	def destroy
		@carrier = Carrier.find(params[:id])

		@carrier.destroy
		redirect_to carriers_path, notice: 'Carrier deleted'
	end
end
