class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def enough_tickets?
    self.attraction.tickets <= self.user.tickets
  end

  def tall_enough?
    self.attraction.min_height <= self.user.height
  end

  def use_tickets
    self.user.tickets -= self.attraction.tickets
    self.user.save!
  end

  def motion_sickness
    self.user.nausea += self.attraction.nausea_rating
    self.user.save!
  end

  def fun_time
    self.user.happiness += self.attraction.happiness_rating
    self.user.save!
  end

  def take_ride
    if enough_tickets? && tall_enough?
      #binding.pry
      use_tickets
      motion_sickness
      fun_time
      "Thanks for riding the #{self.attraction.name}!"
    elsif !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the Roller Coaster."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
  end
end
