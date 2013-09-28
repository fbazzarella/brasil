require 'spec_helper'

describe PagesController do
  render_views
  
  describe 'GET #index' do
    describe 'html format' do
      let!(:with_location) { create(:brazilian, location: 'New York') }
      let!(:without_photo) { create(:brazilian, photo_url: nil) }
      
      before { get :index, format: :html }

      it { expect(assigns(:brazilians)).to be_a ActiveRecord::Relation }
      it { expect(assigns(:brazilians)).to include with_location }
      it { expect(assigns(:brazilians)).to_not include without_photo }
      it { expect(assigns(:total_other_people)).to be_a Integer }
      it { expect(response).to be_success }
    end

    describe 'json format' do
      let!(:with_location) { create(:brazilian, name: 'John Doe', location: 'New York') }
      let!(:without_photo) { create(:brazilian, name: 'Anonymous', photo_url: nil) }
      
      before { get :index, format: :json }

      it { expect(response.body).to match /\"who_is\"\:\"John Doe - New York\"/ }
      it { expect(response.body).to_not match /\"who_is\"\:\"Anonymous\"/ }
      it { expect(response).to be_success }
    end
  end
end
