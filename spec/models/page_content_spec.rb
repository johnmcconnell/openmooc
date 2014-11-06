require 'rails_helper'

describe PageContent do
  let(:basic_page) { FactoryGirl.build(:page_content) }
  let(:too_much_page_content) { FactoryGirl.build(:too_much_page_content) }

  describe "#content" do
    it "stores the content string" do
      expect(basic_page.content).to eq('content')
    end

     it "should not be created with over 1500 words" do
       expect(too_much_page_content).not_to be_valid
     end
  end

  describe "#save" do
    it "renders markdown and saves in html" do
      expect { basic_page.save! }.to change { basic_page.html }.from(nil)
        .to match(/<p>.*<\/p>/)
    end
  end
end
