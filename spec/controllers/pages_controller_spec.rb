require 'spec_helper'

describe PagesController do
  render_views
  
  describe 'GET #index' do
    describe 'html format' do
      let!(:brazilian_with_photo)    { FactoryGirl.create(:brazilian) }
      let!(:brazilian_without_photo) { FactoryGirl.create(:brazilian, photo_url: nil) }
      
      before { get :index, format: :html }

      it { expect(assigns(:brazilians)).to be_a(ActiveRecord::Relation) }
      it { expect(assigns(:brazilians)).to include(brazilian_with_photo) }
      it { expect(assigns(:brazilians)).to_not include(brazilian_without_photo) }
      it { expect(assigns(:total_other_people)).to be_a(Integer) }
      it { expect(response).to be_success }
    end

    describe 'json format' do
      let!(:brazilian_with_photo)    { FactoryGirl.create(:brazilian, name: 'John Doe') }
      let!(:brazilian_without_photo) { FactoryGirl.create(:brazilian, name: 'Anonymous', photo_url: nil) }
      
      before { get :index, format: :json }

      it { expect(assigns(:brazilians)).to match /\"name\"\:\"John Doe\"/ }
      it { expect(assigns(:brazilians)).to_not match /\"name\"\:\"Anonymous\"/ }
      it { expect(response).to be_success }
    end
  end
end
