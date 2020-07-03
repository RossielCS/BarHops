require 'rails_helper'

RSpec.describe 'Attendances', type: :feature do
  before :each do
    User.create(name: 'Alex')
    Group.create(name: 'My Test Group', user_id: 1)
  end

  it 'creates an attendance without group' do
    visit login_path
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Alex')
    click_on 'All my Attendances'
    expect(page).to have_content('ATTENDANCES')
    expect(page).to have_content('ADD NEW ATTENDANCE')
    click_on 'ADD NEW ATTENDANCE'
    expect(page).to have_content('NEW ATTENDANCE')
    expect(page).to have_content('Select quantity')
    expect(page).to have_content('Select group')
    fill_in 'attendance[name]', with: 'My External Attendance'
    find(:select, 'attendance_amount').find(:option, '1').select_option
    click_on 'Save'
    expect(page).to have_content('Attendance created successfully.')
    click_on 'All my External Attendances'
    expect(page).to have_content('Name: My External Attendance')
    expect(page).to have_content('Qty: 1')
  end

  it 'creates an attendance with group' do
    visit login_path
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Alex')
    click_on 'All my Attendances'
    expect(page).to have_content('ATTENDANCES')
    expect(page).to have_content('ADD NEW ATTENDANCE')
    click_on 'ADD NEW ATTENDANCE'
    expect(page).to have_content('NEW ATTENDANCE')
    expect(page).to have_content('Select quantity')
    expect(page).to have_content('Select group')
    fill_in 'attendance[name]', with: 'My Attendance'
    find(:select, 'attendance_amount').find(:option, '1').select_option
    select('My Test Group', from: 'attendance_group_id').select_option
    click_on 'Save'
    expect(page).to have_content('Attendance created successfully.')
    click_on 'All my Attendances'
    expect(page).to have_content('Name: My Attendance')
    expect(page).to have_content('Qty: 1')
  end
end
