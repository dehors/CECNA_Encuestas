json.type resource.class.name.underscore.pluralize
json.id resource.id
json.attributes resource.attributes
if defined? competitors
	json.attributes do
		json.set! :competitors, competitors
	end
end