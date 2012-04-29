class Drop
	include Mongoid::Document
	field :date, :type => Date
	field :po_number

	embedded_in :load, :inverse_of => :drops
end