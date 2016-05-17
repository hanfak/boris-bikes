require 'bikecontainer'

shared_examples_for "bike container" do
  let(:container) {described_class.new}

  describe '#bike_in' do
    let (:bike) {double(:bike)}
    it 'adds bike to van' do
      bike_count = container.bikes.count
      container.bike_in(bike)
      expect(container.bikes.count).to eq bike_count + 1
    end
  end

  describe '#bike_out' do
    let (:bike) {double(:bike)}
    it 'unloads a bike' do
      container.bike_in(bike)
      bike_count = container.bikes.count
      container.bike_out
      expect(container.bikes.count).to eq bike_count-1
    end

    it 'expects error when no bikes' do
        expect {container.bike_out}.to raise_error('No bikes')
    end
  end
end
