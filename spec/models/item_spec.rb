require 'rails_helper'

RSpec.describe Item, type: :model do
    let(:my_user) { 
        create(:user) 
    }

    let(:item) { 
        create(:item, user: my_user)
    }
    
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:name) }
    
    describe "attributes" do
     it "has a name" do
        expect(item).to have_attributes(name: item.name)
     end
   end

end
