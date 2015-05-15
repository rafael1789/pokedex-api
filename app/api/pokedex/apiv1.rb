require 'helpers/shared_helpers.rb'
require 'helpers/pokemon_helpers.rb'
require 'validators/length.rb'
require 'validators/alpha_numeric.rb'
require 'v1/pokemon_resources.rb'
require 'v1/species_resources.rb'
require 'v1/type_resources.rb'
require 'v1/weakness_resources.rb'
require 'v1/skill_resources.rb'
require 'v1/evolution_resources.rb'
require 'v1/location_resources.rb'

module Pokedex
  class APIv1 < Grape::API
    include Guard

        version 'v1', using: :header, vendor: 'pokedex'

        rescue_from ActiveRecord::RecordNotFound do |e|
          Rack::Response.new([ e.message ], 404, { "Content-type" => "text/error" }).finish
        end
        rescue_from NoMethodError do |e|
          Rack::Response.new([ e.message ], 404, { "Content-type" => "text/error" }).finish
        end

        mount PokemonResources
        mount SpeciesResources
        mount TypeResources
        mount WeaknessResources
        mount SkillResources
        mount EvolutionResources
        mount LocationResources
  end
end