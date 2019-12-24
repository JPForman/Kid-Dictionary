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

  describe('create a definition path', {:type => :feature}) do
    it('creates a definition and sees it posted on the words page') do
      word = Word.new('dapper', nil)
      word.save
      visit("/dictionary/#{word.id}")
      fill_in('definition_name', :with => 'fancy')
      click_on('Add Definition')
      expect(page).to have_content('fancy')
    end
  end

end
