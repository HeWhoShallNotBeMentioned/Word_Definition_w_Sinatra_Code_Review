require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe(Word) do
  before() do
    Word.clear()
  end

describe('the add word path', {:type => :feature}) do
  it('adds a word on the index page, checks the page for it') do
    visit('/')
    fill_in('word', :with => 'baseball')
    click_button('Add Word')
    expect(page).to have_content('baseball')
  end
end

describe('checks the individual word page', {:type => :feature}) do
  it('goes to the individual word page and makes sure that is is up and on the right page') do
    visit('/')
    fill_in('word', :with => 'baseball')
    click_button('Add Word')
    click_link('baseball')
    expect(page).to have_content('baseball')
  end
end

describe('adds a definition to the specific word', {:type => :feature}) do
  it('goes to the individual word page creates definition and checks for it') do
    visit('/')
    fill_in('word', :with => 'baseball')
    click_button('Add Word')
    click_link('baseball')
    fill_in('definition', :with => 'the best game ever')
    click_button('Add Definition')
    click_link('baseball')
    expect(page).to have_content('the best game ever')
  end
end
end
