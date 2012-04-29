class ShippersController < ApplicationController
	def index
		@shippers = Shipper.any_of({:name => Regexp.new("^#{params[:search]}.*", true)})
		@shipper = Shipper.first
	end

	def new
		@shippers = Shipper.all
		@shipper = Shipper.new
	end

	def show
		@shippers = Shipper.all
		@shipper = Shipper.find(params[:id])
	end

	def create
		@shipper = Shipper.new(params[:shipper])

		if @shipper.save
			redirect_to shippers_path, notice: 'Shipper successfully created!'
		else
			render :action => 'new'
		end
	end

	def destroy
		@shipper = Shipper.find(params[:id])

		@customer.destroy
		redirect_to shippers_path, notice: 'Shipper deleted'
	end
end
