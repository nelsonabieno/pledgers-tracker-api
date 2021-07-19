class ParishController  < ApplicationController
  def index
    if params[:zone_id].present? && params[:area_id].present?
      # render json: { areas: Parish.where(area_id: params[:area_id]) }, status: :ok
      render json: { parishes: Parish.all }, status: :ok
    end
  end
end