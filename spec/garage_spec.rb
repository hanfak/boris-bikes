require 'garage'
require 'bikecontainer_spec'

describe Garage do
  it {expect(subject).to respond_to(:store).with(1).argument }
  it {expect(subject).to respond_to :release_bike}
  it {expect(subject).to respond_to :fix}

  it_behaves_like "bike container"

  describe '#fix' do
    it 'turns broken bikes into working bikes' do
      4.times do |n|
        bike = Bike.new
        bike.report_broken
        subject.store(bike)
      end
      subject.fix
      expect(subject.bikes).to all(be_working)
    end
  end

end
