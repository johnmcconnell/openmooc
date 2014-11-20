require 'rails_helper'

RSpec.describe Section, :type => :model do
  subject(:section) do
    FactoryGirl.create(:section_with_pages)
  end

  describe '#destroy' do
    it 'deletes all sections of the course' do
      ids = section.pages.map(&:id)
      section.destroy
      ids.each do |id|
        expect(Page.exists?(id: id)).to be false
      end
    end
  end

  describe '::new' do
    it 'is initialized with an empty array of activities' do
      expect(described_class.new.pages).to eq([])
    end
  end
end
