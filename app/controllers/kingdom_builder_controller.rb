class KingdomBuilderController < ApplicationController
  before_action :find_builder, only: [:show, :update, :destroy]

  def index
    all_builders = KingdomBuilder.all
    render json: all_builders, status: :ok
  end

  def create  #NameError (uninitialized constant KingdomBuilder::Parishes):
  new_builder = KingdomBuilder.new(builder_params)
    if new_builder.save
      render json: { message: 'record successfully saved' }, status: :created
    else
      render json: {
                    error: @kingdom_builder.errors.full_messages,
                    message:  'error saving kingdom builder record'
      }, status: :unprocessable_entity
    end
  end

  def show #working
    if @kingdom_builder.present?
      render json: @kingdom_builder , status: :ok
    else
      render json: { message: 'record not found' }, status: :not_found
    end
  end

  def update
    if @kingdom_builder.update(builder_params)
      render json: { message: 'record successfully updated' }, status: :ok
    else
      render json: {
        error: @kingdom_builder.errors.full_messages,
        message:  'error updating kingdom builder record'
      }, status: :internal_server_error
    end
  end

  def destroy
    if @kingdom_builder.update(archive: true)
      render json: { message: 'record successfully updates' }, status: :ok
    else
      render json: {
        error: @kingdom_builder.errors.full_messages,
        message:  'error deleting kingdom builder record'
      }, status: :internal_server_error
    end
  end

  def builders_count
    builders_count = KingdomBuilder.count
    render json: {count: builders_count}, status: :ok
  end

  def payment_breakdown_count
    awaiting_count = KingdomBuilder.where(status: 'awaiting').count
    full_count = KingdomBuilder.where(status: 'full').count
    part_count = KingdomBuilder.where(status: 'part').count

    count_array= [
      { name: 'full payment', count: full_count },
      { name: 'part payment', count: part_count },
      { name: 'awaiting payment', count: awaiting_count },
    ]

    render json: count_array, status: :ok
  end

  def zonal_pledgers_count
    # zone_array = [1,12]
    # res= []
    # zone_array.each do |zone_id|
    #   KingdomBuilder.where(zone: zone_array)
    # end
    zone_1_count =  KingdomBuilder.where(zone_id: 1).count
    zone_2_count =  KingdomBuilder.where(zone_id: 2).count
    zone_3_count =  KingdomBuilder.where(zone_id: 3).count

    count_array= [
      { name: 'zone 1', count: zone_1_count },
      { name: 'zone 2', count: zone_2_count },
      { name: 'zone 3', count: zone_3_count }
    ]

    render json: count_array, status: :ok
  end

  private

  def builder_params
    params.permit(:name, :email, :phone_number, :payment_mode, :amount_pledge, :total_amount_paid, :payment_mode_based_amount, :status, :entered_by, :pledge_type, :zone, :areas_id, :parishes_id, :zone_id)
  end

  def find_builder
    @kingdom_builder = KingdomBuilder.find(params[:id])
  end

end