class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.create(user_params)
    #binding.pry
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


    private
    def user_params
      params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end
end
