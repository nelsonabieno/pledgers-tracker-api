class AreaController  < ApplicationController
  def index
    if params[:zone_id].present?
      render json: { areas: Area.where(zone_id: params[:zone_id]) }, status: :ok
    end
  end
end