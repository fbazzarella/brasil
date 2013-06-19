require 'spec_helper'

describe Brazilian do
  describe '#location' do
    let!(:brazilian) { FactoryGirl.create(:brazilian, city: 'New York', region: nil, country: 'United States') }

    it { expect(brazilian.location).to be_eql('New York - United States') }
  end
end
