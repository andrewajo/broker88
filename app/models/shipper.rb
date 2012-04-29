class Shipper
	include Mongoid::Document

	field :name
	field :status
	field :street_address
	field :unit_number
	field :city
	field :state
	field :country
	field :postal_code
	field :contact_id
	field :autocharge_id
	field :phone_number
	field :toll_free
	field :fax_number
	field :created_at
	field :updated_at

	referenced_in :load
end