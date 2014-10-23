require 'rails_helper'

describe PageContent do
  let(:basic_page) { PageContent.create(content: "content") }

  describe "#content" do
    it "stores the content string" do
      expect(basic_page.content).to eq("content")
    end

     it "should not be created with over 1500 words" do
       expect(PageContent.create(content: 'a' * 1501)).not_to be_valid
     end

     it "content should be immutable" do
       basic_page.content = 'hello'
       expect { basic_page.update! }.to raise_error
     end
  end
end
