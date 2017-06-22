require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_user) { create(:user) }

  context "signed in user" do
    before do
      my_user.confirm
      sign_in my_user
    end
    
    describe "POST create" do
      it "causes the number of items to increase by 1" do
        n = Item.count
        post :create, item: { user: my_user, name: "item \# #{n+1}" }
        expect(Item.count).to eq(n+1)
      end
    end
    
    describe "DELETE destroy" do
      it "causes the number of items to increase by 1" do

        n = Item.count
        post :create, item: { user: my_user, name: "item \# #{n+1}" }
        expect(Item.count).to eq(n+1)
        item = Item.last
        delete :destroy, id: item.id
        expect(Item.count).to eq(n)
      end
    end
  end
end
