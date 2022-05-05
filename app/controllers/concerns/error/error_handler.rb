module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError do |e|
          if e.class.superclass == CustomError
            respond(e.error, e.status, e.message)
          else
            respond(:internal_server_error, 500, e.to_s)
          end
        end
        rescue_from ActiveRecord::RecordNotFound do |e|
          _e = NotFoundError.new(e.to_s.split.slice(0, 3).join(' '))
          respond(_e.error, _e.status, _e.message)
        end
      end
    end

    private

    def respond(_error, _status, _message)
      json = Helpers::Render.json(_error, _status, _message)
      render json: json, status: _status
    end
  end
end