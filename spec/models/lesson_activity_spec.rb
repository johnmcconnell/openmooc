require 'rails_helper'

RSpec.describe LessonActivity, :type => :model do
  describe '::new' do
    it 'defaults with a new page_content' do
      expect(described_class.new.page_content).to be_a PageContent
    end
  end
end
