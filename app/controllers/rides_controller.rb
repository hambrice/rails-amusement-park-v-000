class RidesController < ApplicationController
  def create
    @ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: session[:user_id])
    #@ride.take_ride
    flash[:message] = @ride.take_ride
    redirect_to user_path(session[:user_id])
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end
end
