module PokemonHelpers
    extend Grape::API::Helpers

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
