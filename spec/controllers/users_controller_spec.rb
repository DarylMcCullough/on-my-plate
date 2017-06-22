require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:my_user) { create(:user) }

  context "signed in user" do
    before do
      my_user.confirm
      sign_in my_user
    end
    
    describe "GET #show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  context "user not signed in" do
      describe "GET #show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
