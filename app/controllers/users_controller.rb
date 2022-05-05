class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]
  before_action :get_target_user, only: [:show, :update]

  def show
    render json: {
      data: {
        user: UserSerializer.new(@user, target_is_me: target_is_me?).as_json
      }
    }, status: :ok
  end

  def update
    raise Error::ForbiddenError.new('action is forbidden') if !target_is_me?
    if @user.update(user_params)
      render status: :ok, json: {
        data: UserSerializer.new(@user, target_is_me: target_is_me?)
      }.as_json
    else
      render status: :bad_request, json: { errors: @user.errors }
    end
  end

  private

  def get_target_user
    @user = params[:id] == 'me' ? current_user : User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def target_is_me?
    @user.id == current_user.id
  end
end
