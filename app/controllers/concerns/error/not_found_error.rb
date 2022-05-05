module Error
  class NotFoundError < CustomError
    def initialize(_message = 'not found')
      super(:not_found, 404, _message)
    end
  end
end