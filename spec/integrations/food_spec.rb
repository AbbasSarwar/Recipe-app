require 'rails_helper'

RSpec.describe 'User', type: :system do
  before(:each) do
    @user1 = User.create(name: 'abbas', role: 'admin')
    @food1 = Food.create(name: 'qorma', measurement_unit: 'kg', price: 1000, quantity: 2, user_id: @user1.id)
  end

  describe 'Food' do
    before(:each) do
      visit foods_path
    end

    it 'Food display' do
      expect(page).to have_content(@food1.name)
    end
  end
end
