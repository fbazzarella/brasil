require 'spec_helper'

describe Brazilian do
  describe 'scopes' do
    describe '.reverse' do
      let!(:first) { FactoryGirl.create(:brazilian) }
      let!(:last)  { FactoryGirl.create(:brazilian) }

      subject { described_class.reverse }

      it { expect(subject.first).to be_eql(last) }
      it { expect(subject.last).to be_eql(first) }
    end

    describe '.recent' do
      let!(:people_count) { described_class::TOTAL_PEOPLE_TO_SHOW }

      before do
        people_count.times { FactoryGirl.create(:brazilian) }
      end

      it { expect(described_class.recent.count).to be_eql(people_count) }
    end

    describe '.with_photo' do
      let!(:with_photo)    { FactoryGirl.create(:brazilian) }
      let!(:without_photo) { FactoryGirl.create(:brazilian, photo_url: nil) }

      subject { described_class.with_photo }

      it { expect(subject).to include(with_photo) }
      it { expect(subject).to_not include(without_photo) }
    end
  end

  describe '.total_other_people' do
    let!(:people_count) { described_class::TOTAL_PEOPLE_TO_SHOW + 1 }

    before { people_count.times { FactoryGirl.create(:brazilian) } }

    it { expect(described_class.total_other_people).to be_eql(people_count - described_class::TOTAL_PEOPLE_TO_SHOW) }
  end

  describe '.entire_list_in_json' do
    let!(:with_location) { FactoryGirl.create(:brazilian, name: 'John Doe', location: 'New York') }
    let!(:without_photo) { FactoryGirl.create(:brazilian, name: 'Anonymous', photo_url: nil) }

    subject { described_class.entire_list_in_json }

    it { expect(subject).to match /\"who_is\"\:\"John Doe - New York\"/ }
    it { expect(subject).to_not match /\"who_is\"\:\"Anonymous\"/ }
  end

  describe '#first_name' do
    let(:brazilian) { FactoryGirl.create(:brazilian) }

    it { expect(brazilian.first_name).to be_eql('John') }
  end

  describe '#who_is' do
    context 'when location is present' do
      let(:brazilian) { FactoryGirl.create(:brazilian, location: 'New York, US') }

      it { expect(brazilian.who_is).to be_eql('John Doe - New York, US') }
    end

    context 'when location is not present' do
      let(:brazilian) { FactoryGirl.create(:brazilian, location: nil) }

      it { expect(brazilian.who_is).to be_eql('John Doe') }
    end
  end
end
