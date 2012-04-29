class Pick
	include Mongoid::Document
	field :date, :type => Date
	field :pick_up_number

	embedded_in :load, :inverse_of => :picks
	embeds_many :pick_items

	accepts_nested_attributes_for :pick_items
end