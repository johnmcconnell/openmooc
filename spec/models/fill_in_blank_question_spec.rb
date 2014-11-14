require 'rails_helper'

RSpec.describe FillInBlankQuestion, :type => :model do

  describe '::new' do
    it 'creates a blank answer upon initialization' do
      expect(described_class.new).to have(1).answer
      expect(described_class.new.answers.first).to be_a Answer
    end
  end
end
