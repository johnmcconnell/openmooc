require 'rails_helper'

RSpec.describe Page, :type => :model do
  subject(:page) do
    described_class.new
  end

  let(:section) do
    FactoryGirl.create(:section_with_pages)
  end

  let(:page_with_section) do
    page.update(section: section)
    page
  end

  describe '#section=' do
   it 'sets the #postion as the size of the section.activities' do
     expect{ page.update(section: section) }.to change{ page.position }.from(nil).to(4)
   end
  end
end
