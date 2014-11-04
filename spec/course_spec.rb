require 'rails_helper'
require 'rspec/collection_matchers'

describe Course do
  describe "::new" do
    it 'creates a new course_page' do
      expect(described_class.new.page_content).not_to be_nil
    end

    it 'creates a empty list of sections' do
      expect(described_class.new).to have(0).sections
    end
  end
end
