require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('words', {:type => :feature}) do
  it('displays user\'s input on pages') do
    visit('/new_entry')
    fill_in('word', :with => 'banana')
    fill_in('definition', :with => 'something yellow')
    click_button('Add my word!')
    expect(page).to have_content('banana')
    click_on('banana')
    expect(page).to have_content('something yellow')
  end
end
