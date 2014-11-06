require 'rails_helper'

RSpec.describe Section, :type => :model do
  describe '::new' do
    it 'is initialized with an empty array of activities' do
      expect(Section.build.activities).to eq([])
    end
  end
end
