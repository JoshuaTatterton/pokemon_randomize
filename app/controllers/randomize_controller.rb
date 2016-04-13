class RandomizeController < ApplicationController

  def index
    @players = params[:people].to_i
    @pokemon = params[:pokemon].to_i
  end

end
