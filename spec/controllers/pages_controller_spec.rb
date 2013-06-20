require 'spec_helper'

describe PagesController do
  render_views
  
  describe 'GET #index' do
    let!(:brazilian) { FactoryGirl.create(:brazilian) }
    
    before { get :index }

    it { expect(assigns(:brazilians)).to be_a(ActiveRecord::Relation) }
    it { expect(assigns(:brazilians)).to include(brazilian) }
    it { expect(assigns(:total_other_people)).to be_a(Integer) }
    it { expect(response).to be_success }
  end
end
