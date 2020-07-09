require 'rails_helper'

RSpec.describe 'Authentications', type: :feature do
  before :each do
    User.create(name: 'Alex')
    visit root_path
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('SIGN UP')
  end

  it 'signs up' do
    click_on 'SIGN UP'
    expect(page).to have_content('REGISTER')
    fill_in 'user[name]', with: 'TestUser'
    click_on 'Next'
    expect(page).to have_content('User successfully created.')
  end

  it 'doesn\'t sign up' do
    click_on 'SIGN UP'
    expect(page).to have_content('REGISTER')
    fill_in 'user[name]', with: ''
    click_on 'Next'
    expect(page).to have_content('The user could not be created.')
  end

  it 'logs in' do
    click_on 'LOG IN'
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('You have successfully logged in.')
  end

  it 'doesn\'t log in' do
    click_on 'LOG IN'
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Lucas'
    click_on 'Log In'
    expect(page).to have_content('You could not log in. Invalid name.')
  end

  it 'signs out' do
    click_on 'LOG IN'
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Log Out')
    expect(page).to have_content('Alex')
    click_on 'Log Out'
    expect(page).to have_content('You have successfully logged out.')
  end
end
