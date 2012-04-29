class Customer
	include Mongoid::Document
	field :name
	field :street_address
	field :unit_number
	field :city
	field :state
	field :country
	field :postal_code
	field :contact_id
	field :status
	field :phone_number
	field :toll_free
	field :fax_number
	field :email
	field :created_at, :type => DateTime
	field :updated_at, :type => DateTime

	referenced_in :load
end