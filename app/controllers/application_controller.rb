class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#  rescue_from StandardError, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    logger.error "Erorr(404): #{exception.message}" if exception
    render template: 'errors/error_404', status: 404
  end

  def render_500
    logger.error "Error(500): #{exception.message}" if exception
    render template: 'errors/error_500', status: 500
  end
end
