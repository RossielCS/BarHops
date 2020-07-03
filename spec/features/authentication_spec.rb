require 'rails_helper'

RSpec.describe 'Authentications', type: :feature do
  before :each do
    User.create(name: 'Alex')
  end

  it 'signs up' do
    visit root_path
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
    click_on 'SIGN UP'
    expect(page).to have_content('REGISTER')
    fill_in 'user[name]', with: 'TestUser'
    click_on 'Next'
    expect(page).to have_content('User successfully created.')
  end

  it 'logs in' do
    visit root_path
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
    click_on 'LOG IN'
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Log Out')
    expect(page).to have_content('Alex')
    expect(page).to have_content('All my Attendances')
    expect(page).to have_content('All my External Attendances')
    expect(page).to have_content('All Groups')
  end

  it 'signs out' do
    visit root_path
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
    click_on 'LOG IN'
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Log Out')
    expect(page).to have_content('Alex')
    expect(page).to have_content('All my Attendances')
    expect(page).to have_content('All my External Attendances')
    expect(page).to have_content('All Groups')
    click_on 'Log Out'
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
  end
end
