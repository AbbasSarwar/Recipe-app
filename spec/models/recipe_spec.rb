require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user1 = User.new(name: 'abbas', role: 'admin')
  subject do
    Recipe.new(name: 'Tikka', preparation_time: 120, cooking_time: 60, description: 'recipe', public: true, user: user1)
  end
  describe 'validations' do
    it 'Require name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'Preparation time should be valid' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end
    it 'Cooking time should be valid' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
    it 'Description should be valid' do
      subject.description = 'special tikka'
      expect(subject).to be_valid
    end
    it 'Public should be valid boolean' do
      subject.public = false
      expect(subject).to be_valid
    end
  end
end
