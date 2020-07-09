require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before :each do
    User.create(name: 'Alex')
    visit login_path
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Alex')
    click_on 'All Groups'
    expect(page).to have_content('GROUPS')
    expect(page).to have_content('CREATE A GROUP')
    click_on 'CREATE A GROUP'
  end

  it 'creates a group' do
    expect(page).to have_content('NEW GROUP')
    fill_in 'group[name]', with: 'My Group'
    click_on 'Save'
    expect(page).to have_content('Group created successfully.')
    expect(page).to have_content('Name: My Group')
  end

  it 'doesn\'t create a group without name' do
    expect(page).to have_content('NEW GROUP')
    fill_in 'group[name]', with: ''
    click_on 'Save'
    expect(page).to have_content('Group could not be created.')
  end

  long_name = (0..40).map { ('a'..'z').to_a[rand(26)] }.join
  it 'doesn\'t create a group with a name of more than 40 characters' do
    expect(page).to have_content('NEW GROUP')
    fill_in 'group[name]', with: long_name
    click_on 'Save'
    expect(page).to have_content('Group could not be created.')
  end
end
