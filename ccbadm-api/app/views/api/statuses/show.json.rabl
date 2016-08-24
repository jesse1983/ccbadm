object @object => :data
attribute :uid
attribute :title
attribute :color
attribute :is_active
attribute :description
attribute :order
attribute :meta
attribute :created_at
attribute :updated_at
node(:url) { url_for([:api,@object]) }


# attribute :taxes


