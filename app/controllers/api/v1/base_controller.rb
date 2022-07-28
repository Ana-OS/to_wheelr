class Api::V1::BaseController < ActionController::API
  #  Authorization logic

  before_action :authorize
  rescue_from ActiveRecord::RecordNoTFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  private

  def authorize
    @current_user = User.find(session[:user_id])
    @current_user
  end

  def invalid_record(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

  def not_found
    render json: {errors: ["not auhtorized"]}, status: :unauthorized
  end
end
