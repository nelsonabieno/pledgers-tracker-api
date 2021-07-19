class PaymentController < ApplicationController
  before_action :find_builder
  before_action :find_payment, only: [:show, :update, :destroy]

  def index
    builder_payments = @kingdom_builder.kingdom_builders_payments
    render json: builder_payments, status: :ok
  end

  def create
    new_payment = KingdomBuildersPayment.new(payment_params)
    new_payment.email = @kingdom_builder.email


    if new_payment.save
      total_amount_paid = KingdomBuildersPayment.sum_user_payments(new_payment.email)
      update_kingdom_builders_pay(total_amount_paid)
      render json: { message: 'payment record successfully saved' }, status: :created
    else
      render json: {
        error: @kingdom_builder.errors.full_messages,
        message:  'error saving payment record'
      }, status: :unprocessable_entity
    end
  end

  def show #working
    if @kingdom_builder.present? && @payment.present?
      render json: @payment, status: :ok
    else
      render json: { message: 'payment record not found' }, status: :not_found
    end
  end

  def update
    if @payment.update(payment_params)
      render json: { message: 'record successfully updated' }, status: :ok
    else
      render json: {
        error: @kingdom_builder.errors.full_messages,
        message:  'error updating kingdom builder payment record'
      }, status: :internal_server_error
    end
  end

  # def destroy
  #   if @payment.update(archive: true)
  #     render json: { message: 'record successfully updates' }, status: :ok
  #   else
  #     render json: {
  #       error: @kingdom_builder.errors.full_messages,
  #       message:  'error deleting kingdom builder record'
  #     }, status: :internal_server_error
  #   end
  # end

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
    zone_1_count =  KingdomBuilder.where(zone: '1').count
    zone_12_count =  KingdomBuilder.where(zone: '12').count

    count_array= [
      { name: 'zone 1', count: zone_1_count },
      { name: 'zone 12', count: zone_12_count }
    ]

    render json: count_array, status: :ok
  end

  private

  def find_builder
    @kingdom_builder = KingdomBuilder.find(params[:kingdom_builder_id])
  end

  def find_payment
    @payment = @kingdom_builder.kingdom_builders_payments.find(params[:id])
  end

  def payment_params
    params.permit(:amount_paid, :entered_by, :kingdom_builder_id )
  end

  def update_kingdom_builders_pay(total_amount_paid)
    KingdomBuilder.find(params[:kingdom_builder_id]).update_attribute(:total_amount_paid, total_amount_paid)
  end
end