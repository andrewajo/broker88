class PickItem
	include Mongoid::Document

	field :shipper
	field :amount, :type => Integer
	field :unit
	field :commodity

	embedded_in :pick, :inverse_of => :pick_items
end