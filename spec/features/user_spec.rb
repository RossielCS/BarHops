require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before :each do
    @user_one = User.create(name: 'Alex')
    @user_two = User.create(name: 'Julia')
    @group = Group.create(name: 'My Test Group', user_id: @user_one.id)
    @attendance_one = Attendance.create(name: 'Alex\'s Attendance', author_id: @user_one.id,
                                        group_id: @group.id, amount: 1)
    @attendance_two = Attendance.create(name: 'Julia\'s Attendance', author_id: @user_two.id,
                                        group_id: @group.id, amount: 1)
  end

  it 'shows the users that have groups in common' do
    visit login_path
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: @user_one.name
    click_on 'Log In'
    expect(page).to have_content('Alex')
    click_on 'Bar Hopping Users'
    expect(page).to have_content('Name: Julia')
    expect(page).to have_content('Groups in common:')
    expect(page).to have_content('My Test Group')
  end
end
