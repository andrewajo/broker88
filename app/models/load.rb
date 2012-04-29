class Load
	include Mongoid::Document
	field :load_number
	key   :load_number

	field :carrier_name
	field :customer_name
	field :carrier_id
	field :customer_id
	field :location_id
	field :claim_id
	field :charge_id
	field :carrier_rate
	field :customer_rate
	field :temp
	field :driver_cell
	field :customer_currency
	field :carrier_currency
	field :customer_po
	field :created_at, :type => DateTime
	field :updated_at, :type => DateTime

	references_many :shippers
	references_many :customers
	references_many :carriers

	embeds_many :picks
	embeds_many :drops

	accepts_nested_attributes_for :picks
	accepts_nested_attributes_for :drops

	before_create :create_load_number

	private
		def create_load_number
			@loadnumber = Load.max("load_number").to_i + 1
			self.load_number = @loadnumber.to_s
		end
end