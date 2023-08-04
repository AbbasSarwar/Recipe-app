require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user1 = User.new(name: 'abbas', role: 'admin')
    Food.new(name: 'qorma', measurement_unit: 'kg', price: 1000, quantity: 2, user: user1)
  end

  describe 'validations' do
    it 'Name should be exist' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'Quantity should be integer' do
      subject.quantity = 'two'
      expect(subject).to_not be_valid
    end
    it 'measurement_unit should be not nil' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end
    it 'Price should be integer' do
      subject.price = 'thousand'
      expect(subject).to_not be_valid
    end
  end
end
