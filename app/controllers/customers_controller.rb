class CustomersController < ApplicationController
	def index
		@customers = Customer.any_of({:name => Regexp.new("^#{params[:search]}.*", true)})
		@customer = @customers.first
	end

	def new
		@customers = Customer.all
		@customer = Customer.new
	end

	def show
		@customers = Customer.all
		@customer = Customer.find(params[:id])
	end

	def create
		@customer = Customer.new(params[:customer])

		if @customer.save
			redirect_to customers_path, notice: 'Customer successfully created!'
		else
			render :action => 'new'
		end
	end

	def destroy
		@customer = Customer.find(params[:id])

		@customer.destroy
		redirect_to customers_path, notice: 'Customer deleted'
	end
end
