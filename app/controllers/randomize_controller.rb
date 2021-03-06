class RandomizeController < ApplicationController

  def index
    @players = params[:people].to_i if params[:people]
    @pokemon = params[:pokemon].to_i if params[:pokemon]

    playerset
    pokemonset
  end

  def show
    render json: {
      pokemon: ActionController::Base.helpers.asset_path("pokemon/#{params[:pokemon]}")
    }
  end

  private

  def playerset
    @players ||= 4
  end

  def pokemonset
    @pokemon ||= 3
  end

end
