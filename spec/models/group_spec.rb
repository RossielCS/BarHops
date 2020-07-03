require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'My Group') }

  describe 'Validations' do
    # Name
    it { should validate_length_of(:name).is_at_least(4).is_at_most(40) }

    it { should_not allow_value('').for(:name) }

    short_name = (0..2).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(short_name).for(:name) }

    long_name = (0..40).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(long_name).for(:name) }

    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'Group' do
    # User
    it { should belong_to(:user) }

    # Attendances
    it { should have_many(:attendances) }
  end
end
