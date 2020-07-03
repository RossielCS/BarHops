require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Lucas') }

  describe 'Validations' do
    # Name
    it { should validate_length_of(:name).is_at_least(4).is_at_most(25) }

    it { should_not allow_value('').for(:name) }

    short_name = (0..2).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(short_name).for(:name) }

    long_name = (0..25).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(long_name).for(:name) }

    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'User' do
    # Attendances
    it { should have_many(:attendances).with_foreign_key('author_id').dependent(:destroy) }

    # Groups
    it { should have_many(:groups).dependent(:destroy) }
  end
end
