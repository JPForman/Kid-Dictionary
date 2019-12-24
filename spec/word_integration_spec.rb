require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the words page') do
    visit('/dictionary')
    click_on('Add a new word :)')
    fill_in('word_name', :with => 'dapper')
    click_on('Go!')
    expect(page).to have_content('dapper')
  end
end
