require_relative 'bikecontainer'

class Van
  include BikeContainer

  alias_method :load, :bike_in
  alias_method :unload, :bike_out

  attr_reader :bikes

  def initialize
	  @bikes = []
	end
end
