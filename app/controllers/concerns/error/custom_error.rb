module Error
  class CustomError < StandardError
    attr_reader :status, :error, :message

    def initialize(_error = nil, _status = nil, _message = nil)
      @error = _error || 500
      @status = _status || :unprocessable_entity
      @message = _message || 'internal server error'
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end