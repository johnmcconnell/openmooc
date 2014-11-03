require 'rails_helper'

describe Course do
  describe "::new" do
    it "creates a new course_page" do
      expect(described_class.new.page_content).not_to be_nil
    end
  end
end
