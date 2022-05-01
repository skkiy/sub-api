module ErrorHandle
  extend ActiveSupport::Concern

  included do
    class Forbidden < ActionController::ActionControllerError; end

    class IpAddressRejected < ActionController::ActionControllerError; end

    rescue_from Exception, with: :rescue500
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
    rescue_from Forbidden, with: :rescue403
    rescue_from IpAddressRejected, with: :rescue403
    rescue_from ActionController::RoutingError, with: :rescue404

    def rescue400(e)
      @exception = e
      render 'error_messages/400'
    end

    def rescue401(e)
      @exception = e
      render 'error_messages/401'
    end

    def rescue403(e)
      @exception = e
      render 'error_messages/403'
    end

    def rescue404(e)
      @exception = e
      render 'error_messages/404'
    end

    def rescue500(e)
      @exception = e
      render 'error_messages/500'
    end

  end
end