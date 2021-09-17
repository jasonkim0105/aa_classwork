class Api::PokemonController < ApplicationController
    def index
        @pokemon = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        if @pokemon
            render :show
        else
            render json: @pokemon.errors.full_messages
        end
    end
end
