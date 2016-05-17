require_relative 'bike'
require_relative 'bikecontainer'

class DockingStation
	include BikeContainer

	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
	  @bikes = []
	end

	def release_bike
		raise ("No bikes left, try again later") if empty?
		bike = @bikes.last
		raise ("Sorry, this bike is broken") unless bike.working?
		bike_out
	end

	def release_broken_bike
		@bikes.shift if !@bikes.first.working?
	end

	def dock_bike(bike)
		raise ("There are no spaces available") if full?
		bike_in(bike)
	  @bikes.sort_by!{|bike| bike.working?.to_s}
	end
end
