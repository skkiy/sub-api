module Error
  class BadRequestError < CustomError
    def initialize(_message = 'bad request')
      super(:not_found, 400, _message)
    end
  end
end
