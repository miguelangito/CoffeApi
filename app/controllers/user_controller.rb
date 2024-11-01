class UserController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocesable_entity
    end
  end

  private
    def user_params
      params.required(:user).permit(:name, :documentNumber)
    end
end
