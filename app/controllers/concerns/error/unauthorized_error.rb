module Error
  class UnauthorizedError < CustomError
    def initialize(_message = 'unauthorized')
      super(:unauthorized, 401, _message)
    end
  end

end