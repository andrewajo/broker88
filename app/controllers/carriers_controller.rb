class CarriersController < ApplicationController
	def index
		@page = params[:page] ? params[:page] : 1

		@carriers = Carrier.any_of({:name => Regexp.new("^#{params[:search]}.*", true)}, {:mc_number => Regexp.new("#{params[:search]}.*", true)}).page(@page)
		#@carriers = Carrier.all
		@carrier = @carriers.first
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
