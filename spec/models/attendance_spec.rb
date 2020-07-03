require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject { Attendance.new(name: 'My Attendance', amount: 3) }

  describe 'Validations' do
    # Name
    it { should validate_length_of(:name).is_at_least(4).is_at_most(30) }

    it { should_not allow_value('').for(:name) }

    short_name = (0..2).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(short_name).for(:name) }

    long_name = (0..30).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(long_name).for(:name) }

    it { should validate_uniqueness_of(:name).case_insensitive }

    # Amount
    it { should validate_numericality_of(:amount).only_integer }
  end

  describe 'Group' do
    # User
    it { should belong_to(:author).class_name('User') }

    # Group
    it { should belong_to(:group).optional }
  end
end
