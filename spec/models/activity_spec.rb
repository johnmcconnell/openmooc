require 'rails_helper'

RSpec.describe Activity, :type => :model do
  subject(:activity) do
    Activity.new
  end

  let(:section) do
    FactoryGirl.build(:section_with_activities)
  end

  describe '#section=' do
   it 'sets the #postion as the size of the section.activities' do
     expect{ activity.update(section: section) }.to change{ activity.position }.from(nil).to(3)
   end
  end
end
