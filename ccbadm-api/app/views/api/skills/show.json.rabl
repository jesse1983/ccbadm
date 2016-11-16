object @object => :data
attribute :id
attribute :name
attribute :model
attribute :name_pt_br
attribute :model_pt_br

node(:url) { url_for([:api, @object]) }