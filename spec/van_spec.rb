require 'van'
require 'dockingstation'

describe Van do
  it {expect(subject).to respond_to(:load).with(1).argument }
  it {expect(subject).to respond_to :unload}
  describe '#load' do
    let (:bike) {double(:bike)} 
    it 'adds bike to van' do
      bike_count = subject.bikes.count
      subject.load(bike)
      expect(subject.bikes.count).to eq bike_count+1
    end
  end


end
