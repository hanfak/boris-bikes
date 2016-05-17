require 'bike'


describe Bike do
	describe '#working?' do
		it { expect(subject).to respond_to :working? }

		it 'expects bikes to be working' do
			expect(subject.working?).to eq true
		end

		it 'expects bike to not be working after a user reports its broken' do
			subject.report_broken
			expect(subject).not_to be_working
		end

	end

	describe '#report_broken' do
		it 'change status of bike to broken' do
			subject.report_broken
			expect(subject).to be_broken
		end
	end

	describe '#report_working' do
		it 'change status of bike to working' do
			subject.report_working
			expect(subject).to be_working
		end
	end

	describe '#broken?' do
		it 'should expect new bike to not be broken' do
			expect(subject).not_to be_broken
		end

	end


end
