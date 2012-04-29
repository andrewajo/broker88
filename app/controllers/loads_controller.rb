class LoadsController < ApplicationController
	autocomplete :carrier, :name
	autocomplete :customer, :name
	autocomplete :shipper, :name
	def index
		@loads = Load.any_of({:load_number => Regexp.new("^#{params[:search]}.*", true)}, {:carrier_name => Regexp.new("^#{params[:search]}.*", true)}, {:customer_name => Regexp.new("^#{params[:search]}.*", true)})
		@load = @loads.first
	end

	def new
		@loads = Load.all
		@load = Load.new
		@pick = @load.picks.build()
		@drop = @load.drops.build()
		@pick_item = @pick.pick_items.build()
		#@drop.drop_items.build()
	end

	def show
		@loads = Load.all
		@load = Load.find(params[:id])
	end

	def create
		@load = Load.new(params[:load])

		if @load.save
			redirect_to loads_path, notice: 'New load created!'
		else
			render :action => 'new'
		end
	end
end
