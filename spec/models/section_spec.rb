require 'rails_helper'

RSpec.describe Section, :type => :model do
  describe '::new' do
    it 'is initialized with an empty array of activities' do
      expect(described_class.new.activities).to eq([])
    end
  end
end
