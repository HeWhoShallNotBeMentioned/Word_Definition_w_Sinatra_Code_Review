require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word project path', {:type => :feature}) do
  before() do
    Word.clear()
  end


  it('adds a word on the index pagebase, checks the page for it.') do
    visit('/')
    fill_in('word', :with => 'baseball')
    click_button('Add Word')
    expect(page).to have_content('baseball')
  end


  it('goes to the individual word page created, adds a definition and checks for it .') do
    visit('/all_words/:id')
    fill_in('word', :with => 'baseball')
    click_button('Add Word')
    click_link('baseball')
    fill_in('definition', :with => 'the best game ever')
    click_button('Add Definition!')
    expect(page).to have_content('the best game ever')
  end

end
