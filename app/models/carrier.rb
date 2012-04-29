class Carrier
	include Mongoid::Document
	field :name
	field :street_address
	field :unit_number
	field :city
	field :state
	field :country
	field :postal_code
	field :contact_id, :type => Integer
	field :equipment_id, :type => Integer
	field :certificate_id, :type => Integer
	field :status
	field :mc_number
	field :phone_number
	field :toll_free
	field :fax_number
	field :email
	field :insurance_broker
	field :insurance_company
	field :insurance_policy_number
	field :insurance_cargo_limit, :type => Integer
	field :insurance_expiry, :type => Date
	field :reefer_breakdown, :type => Boolean
	field :created_at, :type => DateTime
	field :updated_at, :type => DateTime

	referenced_in :load

	paginates_per 15
end
