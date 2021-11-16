require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) { create(:user) }

  describe 'Food model' do
    before :each do
      @food = build(:food)
      @food.user = user
    end

    it 'should be valid' do
      expect(@food).to be_valid
    end

    it 'should not be valid with empty fields' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid with empty fields' do
      @food.measure_unit = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid with empty fields' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid with incorrect string for measure units' do
      @food.measure_unit = 'not a valid string'
      expect(@food).to_not be_valid
    end

    it 'should not be valid if food with same name already exists' do
      @second_food = build(:food)
      @second_food.name = @food.name
      @food.save
      expect(@second_food).to_not be_valid
    end
  end
end
