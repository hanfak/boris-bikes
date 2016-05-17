require './lib/dockingstation.rb'
require './lib/bike.rb'
require './lib/van.rb'
require './lib/garage.rb'


station = DockingStation.new
van = Van.new
garage = Garage.new

bikes = []
11.times{bikes << Bike.new}
bikes.each{|bike| bike.report_broken}
bikes.each{|bike| station.dock_bike(bike)}

while !station.bikes.empty?
  bike = station.release_broken_bike
  van.load(bike)
end

while !van.bikes.empty?
  bike = van.unload
  garage.store(bike)
end

garage.fix

while !garage.bikes.empty?
  bike = garage.release_bike
  van.load(bike)
end

while !van.bikes.empty?
  bike = van.unload
  station.dock_bike(bike)
end
