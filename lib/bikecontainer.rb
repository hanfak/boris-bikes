module BikeContainer


  def bike_in(bike)
    @bikes << bike
  end

  def bike_out
    raise ("No bikes") if empty?
    @bikes.pop
  end

  private

  def empty?
  	@bikes.length == 0
  end

  def full?
		@bikes.length >= @capacity
	end

end
