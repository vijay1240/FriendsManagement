class Api::BaseController < ActionController::API

  respond_to :json


  class AuthorizationError < StandardError; end

  rescue_from AuthorizationError, with: :unauthorized
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def unauthorized
    render json: {}, status: :unauthorized
  end

  def bad_request
    render json: { error: 'Please check that you sent params as required in API documentation.' }, status: :bad_request
  end

  def pagination_dict(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

end
