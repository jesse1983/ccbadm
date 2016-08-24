object @object => :data
attribute :id
attribute :code
attribute :title
attribute :group_code
attribute :accountant_code
attribute :cartographic_code
attribute :tax_code
attribute :is_active
attribute :has_church
attribute :market_price
attribute :category
attribute :status
attribute :situation
# attribute :address
# attribute :zipcode
attribute :zone
attribute :income
attribute :quarter
attribute :court
attribute :lot
attribute :terrain_area
attribute :width_area
attribute :main_area
attribute :trash_area
attribute :secondary_area
attribute :excess_area
attribute :default_type
attribute :default_category
attribute :rate
attribute :comment
# attribute :object_terrain
attribute :latitude
attribute :longitude
attribute :full_address
attribute :created_at
attribute :updated_at

if expand?(@object, "documents")
	child :documents, :root => :documents, :object_root => false do |object| extends "api/documents/show" end
else
	node(:documents) { url_for([:api,@object,Document]) }
end
if expand?(@object, "church")
	child :church, :root => :church, :object_root => false do |object| extends "api/churches/show" end
else
	node(:church) { "#{api_churches_path()}/#{@object.church_id}" } if @object.church_id
end
node(:url) { url_for([:api,@object]) }


# attribute :taxes


