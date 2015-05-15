module Pokedex
  class PokemonResources < Grape::API
    include Guard
    #guard_all!  # Requires a valid OAuth 2 Access Token to use all Endpoints

    helpers SharedHelpers
    helpers PokemonHelpers

    doorkeeper_for :all

    resource :pokemons do
      desc 'Return current user, requires authentication'
      get 'me' do
        current_resource_owner
      end

      desc "list all pokemons"
      get '/', protected: false do #, :rabl => 'pokemons/index' do
        @pokemons = Pokemon.all
        present :pokemons, @pokemons, with: Pokedex::Entities::Pokemon
      end
      
      desc "show a pokemon"
      params do 
        requires :id, type: Integer, desc: 'Pokemon\'s id'
      end
      get ':id', :rabl => 'pokemons/show' do
        #guard!
        pokemon
      end

      desc "create a new pokemon" do
        params Pokedex::Entities::Pokemon.documentation
      end
      params do
        use :pokemon_params
      end
      post do
        Pokemon.create(permitted_params[:pokemon])
      end

      desc "update a pokemon"
      params do
        use :pokemon_params
      end
      put ':id' do
        pokemon.update(permitted_params[:pokemon])
      end

      desc "delete a pokemon"
      params do
        requires :id, type: Integer, desc: 'Pokemon\'s id'
      end
      delete ':id' do
        pokemon.destroy!
      end

    end
  end
end