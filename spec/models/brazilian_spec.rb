require 'spec_helper'

describe Brazilian do
  describe 'scope .recent' do
    let!(:people_count) { described_class::TOTAL_PEOPLE_TO_SHOW }

    before do
      people_count.times { FactoryGirl.create(:brazilian) }
    end

    it { expect(described_class.recent.count).to be_eql(people_count) }
    it { expect(described_class.recent.first).to be_eql(described_class.last) }
  end

  describe 'scope .with_photo' do
    let!(:with_photo)    { FactoryGirl.create(:brazilian, photo_url: 'http://example.com/image.jpg') }
    let!(:without_photo) { FactoryGirl.create(:brazilian, photo_url: nil) }

    it { expect(described_class.with_photo).to include(with_photo) }
    it { expect(described_class.with_photo).to_not include(without_photo) }
  end

  describe '.count' do
    let!(:people_count) { described_class::TOTAL_PEOPLE_TO_SHOW + 1 }

    before { people_count.times { FactoryGirl.create(:brazilian) } }

    it { expect(described_class.total_other_people).to be_eql(people_count - described_class::TOTAL_PEOPLE_TO_SHOW) }
  end

  describe '#first_name' do
    let(:brazilian) { FactoryGirl.create(:brazilian) }

    it { expect(brazilian.first_name).to be_eql('John') }
  end
end
