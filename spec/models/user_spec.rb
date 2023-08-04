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
    it 'Password required cant be blank' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "Password length shouldn't be shorter" do
      subject.password = 'ab'
      expect(subject).to_not be_valid
    end
    it 'Name should be valid' do
      subject.name = 'abbas'
      expect(subject).to be_valid
    end
  end
end
