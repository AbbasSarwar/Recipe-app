require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    let(:user) { FactoryBot.create(:user) }
     before do 
      user.valid?
     end

    it "is valid with name, email, and password" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    
    it 'is invalid without an email' do
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = User.new(name: 'ajaz', email: 'ajaz@example.com', password: nil)
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "user requires email to be unique" do
      user2 = User.new(name: 'ajaz' , email: user.email, password: 'sadiq123')
      expect(user2).to_not be_valid
      expect(user2.errors[:email]).to include("has already been taken")
    end

 
  end

end


  