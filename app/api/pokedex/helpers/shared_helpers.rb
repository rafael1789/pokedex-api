module SharedHelpers
    extend Grape::API::Helpers

    params :pagination do
      optional :page, type: Integer, default: 1, documentation: {type: "integer", desc: "The number of the page requested."}
      optional :per_page, type: Integer, default: 10, documentation: {type: "integer" , desc: "The number of items being requested."}
    end

    def current_token
      env['api.token']
    end

    def current_resource_owner
      User.find(current_token.resource_owner_id) if current_token
    end

    def permitted_params
      @permitted_params ||= declared(params, include_missing: false)
    end

    params :pokemon_params do
	    requires :pokemon, type: Hash do
	      requires :name, length: 140, type: String, desc: 'Pokemon\'s name'
	      optional :avatar, type: String, desc: 'Pokemon\'s avatar'
	      optional :height, type: Float, desc: 'Pokemon\'s height'
	      optional :weight, type: Float, desc: 'Pokemon\'s weight'
	    end
    end

    def pokemon
      @pokemon = Pokemon.find(params[:id]) rescue nil
      unless @pokemon
      	error!(
      		{ message: 'Not found', 
      		  with: Pokedex::Entities::Error 
      		}, 404
      		)
      end
      @pokemon
    end
end
