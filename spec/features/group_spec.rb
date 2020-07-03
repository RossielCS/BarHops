require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before :each do
    User.create(name: 'Alex')
  end

  it 'creates a group' do
    visit login_path
    expect(page).to have_content('LOGIN')
    fill_in 'session[name]', with: 'Alex'
    click_on 'Log In'
    expect(page).to have_content('Alex')
    click_on 'All Groups'
    expect(page).to have_content('GROUPS')
    expect(page).to have_content('CREATE A GROUP')
    click_on 'CREATE A GROUP'
    expect(page).to have_content('NEW GROUP')
    fill_in 'group[name]', with: 'My Group'
    click_on 'Save'
    expect(page).to have_content('Name: My Group')
  end
end
