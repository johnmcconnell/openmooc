require 'rails_helper'

describe Feedback do
  let(:feedback) { FactoryGirl.build(:feedback) }
  let(:no_subject) { FactoryGirl.build(:no_subject_feedback) }
  let(:no_message) { FactoryGirl.build(:no_message_feedback) }

  describe '#valid?' do
    it 'is not valid with no subject' do
      expect(no_subject).to_not be_valid
    end

    it 'is not valid with no message' do
      expect(no_message).to_not be_valid
    end
  end
end
