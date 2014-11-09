require 'rails_helper'

RSpec.describe Activity, :type => :model do
  subject(:activity) do
    Activity.new
  end

  let(:section) do
    FactoryGirl.create(:section_with_activities)
  end

  let(:activity_with_section) do
    activity.update(section: section)
    activity
  end

  describe '#section=' do
   it 'sets the #postion as the size of the section.activities' do
     expect{ activity.update(section: section) }.to change{ activity.position }.from(nil).to(5)
   end
  end
end
