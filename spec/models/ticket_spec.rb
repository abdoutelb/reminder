RSpec.describe Ticket, type: :model do
  subject { create(:ticket) }

  context "#validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  context "#relations" do
    it { is_expected.to have_one(:user) }
  end

end

