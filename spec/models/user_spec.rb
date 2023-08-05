require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'abbas', role: 'admin', email: 'abbas@gmail.com', password: 'abbas.123')
  end

  describe 'validations' do
    it "Email required can't be blank" do
      subject.email = nil
      expect(subject).to_not be_valid
    end


    it 'is invalid without an email' do
      user = User.new(name: 'ajaz', email: 'ajaz@example.com', password: "asssaddasf")
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = User.new(name: 'ajaz', email: 'ajaz@example.com', password: nil)
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'user requires email to be unique' do
      user = User.create(name:"abbas", email:"abbas@gmail.com",password:"abbas123")
      user2 = User.new(name: 'ajaz', email: user.email, password: 'sadiq123')
      expect(user2).to_not be_valid
      expect(user2.errors[:email]).to include('has already been taken')
    end
    it 'sets the default name based on the email' do
      user = User.new(email: 'riyaz ahmed@gmail.com')
      user.set_default
      expect(user.name).to eq('riyaz ahmed')
    end

    it 'handles nil email gracefully' do
      user = User.new(email: nil)
      user.set_default
      expect(user.name).to be_nil
    end
  end
end
