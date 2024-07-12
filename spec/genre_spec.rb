require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      genre = Genre.new(name: 'Comedy')
      expect(genre).to be_valid
    end

    it 'is not valid without a name' do
      genre = Genre.new(name: '')
      expect(genre).not_to be_valid
    end
  end
end
