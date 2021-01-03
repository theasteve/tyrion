class SpacsController < ApplicationController
  def index
    spacs = Spac.all.order('definitive_agreement desc')
    render json: SpacSerializer.new(spacs).serializable_hash, status: 200
  end

  def show
    spac = Spac.find(params[:id])
    render json: SpacSerializer.new(spac).serializable_hash, status: 200
  end
end
