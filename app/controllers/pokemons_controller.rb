class PokemonsController < ApplicationController
    before_action :set_pokemon, only: [:show, :update, :destroy] 

    def index
        pokemons = Pokemon.all
        render json: pokemons
    end

    def show
        render json: pokemon
    end

    def create
        pokemon = Pokemon.new(pokemon_params)

        if pokemon.save
            render json: pokemon, status: :created, location: pokemon
        else
            render json: pokemon.errors, status: :unprocessable_entity
        end
    end

    def update
        if pokemon.update(pokemon_params)
            render json: pokemon
        else
            render json: pokemon.errors, status: :unprocessable_entity
    end

    def destroy
        pokemon.destroy
        render json: {message: "Successfully deleted!"}
    end

    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :poke_type, :weight, :front_image, :back_image)
    end

    def set_pokemon
        pokemon = Pokemon.find_by(id: params[:id])
    end

end
