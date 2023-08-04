require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    let(:food) { Food.new }
    before do
      food.valid?
    end

    it 'requires a user' do
      expect(food.errors[:user]).to include("can't be blank")
    end
  end
end
