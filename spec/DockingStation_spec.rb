require 'dockingstation'
require 'bikecontainer_spec'

describe DockingStation do
	it {expect(subject).to respond_to :release_bike }
	it {expect(subject).to respond_to :release_broken_bike }

	it_behaves_like "bike container"

	describe '#release_bike' do
		let(:bike) {double(:bike)}
		# it "checks whether release_bike gets a bike" do
		# allow(bike).to receive(:working?).and_return(true)
		# 	subject.dock_bike(bike)
		#   expect(subject.release_bike).to be_a(bike.class)
		# end

		it	'expects error when trying to release a broken bike' do
			allow(bike).to receive(:report_broken).and_return false
			allow(bike).to receive(:working?).and_return(false)
			bike.report_broken
			subject.dock_bike(bike)
			expect {subject.release_bike}.to raise_error(RuntimeError, "Sorry, this bike is broken")
		end


		it 'expects the released bike to be working' do
			allow(bike).to receive(:working?).and_return(true)
			subject.dock_bike(bike)
			released_bike = subject.release_bike
			expect(released_bike.working?).to eq (true)
		end
		# it 'expects error when no bikes' do
		# 		expect {subject.release_bike}.to raise_error(RuntimeError)
		# end
	end

	describe '#release_broken_bike' do
		let(:bike) {double(:bike)}
		it '.release_broken_bike should only release broken bike' do
			allow(bike).to receive(:working?).and_return(false)
			subject.dock_bike(bike)
			released_bike = subject.release_broken_bike
			expect(released_bike.working?).to eq (false)
		end
	end

	describe "#capacity" do
		it 'expects capacity to have default of 20' do
			expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end

		it 'expects to start with different capacity' do
			dock = DockingStation.new(30)
			expect(dock.capacity).not_to eq DockingStation::DEFAULT_CAPACITY
		end
	end

	describe '#dock_bike' do
		let(:bike) {double(:bike)}
		 it {expect(subject).to respond_to(:dock_bike).with(1).argument }

		 it 'expects error when dock is full' do
			allow(bike).to receive(:working?).and_return(true || false)
 			subject.capacity.times { subject.dock_bike(bike)}
 			expect {subject.dock_bike(bike)}.to raise_error("There are no spaces available")
 		end

		it 'sorts bikes by status' do
			4.times do |n|
				bike = Bike.new
				bike.report_broken if n.even?
			  subject.dock_bike(bike)
			end
			find_working = false
			test_pass = true
			subject.bikes.each do |bike|
				find_working = true if bike.working?
				test_pass = false if find_working && !bike.working?
			end
			expect(test_pass).to be true
		end

  end

	describe '#bikes'  do
		it 'expect to see a bike' do
			expect(subject.bikes).to be_a(Array)
		end

	end




=begin
it 'allows a capacity to be set' do
	expect(subject.capacity=10).to eq subject.capacity
end

it 'checks whether the capacity is DEFAULT CAPACITY' do
	expect(subject.capacity).to eq subject.class::DEFAULT_CAPACITY
end

=end

end
