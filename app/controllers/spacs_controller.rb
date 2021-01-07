class SpacsController < ApplicationController
  include CurrentUserConcern

  def index
    track_current_user_spacs_visit if @current_user
    spacs = Spac.all.order('definitive_agreement desc')
    render json: SpacSerializer.new(spacs).serializable_hash, status: 200
  end

  def show
    spac = Spac.find(params[:id])
    track_current_user_spac_visit(spac) if @current_user
    render json: SpacSerializer.new(spac).serializable_hash, status: 200
  end

  private

  def track_current_user_spacs_visit
    tracker.track(@current_user.id, 'Spacs page visited')
  end

  def track_current_user_spac_visit(spac)
    track_params = { spac_id: spac.id, spac_name: spac.name }
    tracker.track(@current_user.id, 'Spac Visit', track_params)
  end
end
