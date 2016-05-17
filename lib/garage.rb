require_relative 'bikecontainer'

class Garage
  include BikeContainer

  alias_method :store, :bike_in
  alias_method :release_bike, :bike_out

  attr_reader :bikes

  def initialize
	  @bikes = []
	end

  def fix
    bikes.each do |bike|
      bike.report_working
    end
  end
end
