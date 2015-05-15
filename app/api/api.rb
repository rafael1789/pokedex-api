require 'pokedex/concerns/guard.rb'
require 'pokedex/apiv1.rb'

class API < Grape::API
	prefix :api

	format :json
	formatter :json, Grape::Formatter::Rabl
	default_format :json

	mount Pokedex::APIv1
end