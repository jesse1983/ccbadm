object @object => :data
attribute :id
attribute :title
attribute :code
attribute :short_name
attribute :order
attribute :is_mandatory
attribute :is_expirable
attribute :is_active
attribute :created_at
attribute :updated_at
node(:url) { url_for([:api,@object]) }


# attribute :taxes


