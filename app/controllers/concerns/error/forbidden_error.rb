module Error
  class ForbiddenError < CustomError
    def initialize(_message = 'forbidden')
      super(:forbidden, 403, _message)
    end
  end
end
