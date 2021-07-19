class ZoneController  < ApplicationController
  def index
    render json: { zones: Zone.all }, status: :ok
  end
end