require 'pry'
require File.expand_path '../spec_helper.rb', __FILE__

# Check out the cheat sheet here for capybara matchers http://www.launchacademy.com/codecabulary/learn-test-driven-development/rspec/capybara-cheat-sheet
describe 'the greatest wizard bio of all time' do

  before(:each) do
    visit('/')
  end

  it 'has an awesome title' do
    within("h1.responsive-headline") do
      expect(page).to have_content("I'm Faizaan the Wizard")
    end
  end

  it 'has  6 items in the main nav' do
    nav_bar = page.find('ul#nav')
    expect(nav_bar).to have_css('li', count: 6)
  end

  it 'has an education from Hogwarts' do
    within("section#resume") do
      expect(page).to have_content("Hogwarts")
    end
  end

  it 'has a testimonial written by Adam Sheehan' do
    within("section#testimonials") do
      expect(page).to have_css('cite', text: 'Adam Sheehan')
    end
  end

  it 'has a button to book Faizaan the Wizard' do
    book_faizaan = page.find('section#call-to-action')
    expect(book_faizaan).to have_css('a.button', text: 'Wizard me now')
  end

  it 'has 7 social media sharing links' do
      social_links = page.find('ul.social')
      expect(social_links).to have_css('li', count: 7)
      links  = social_links.all('li')
      expect(links[2]).to have_css('i.fa-google-plus')
  end

  it 'has an about section' do
    expect(page).to have_css('section#about')
  end

  it 'has a link to download the wizards resume' do
    expect(page).to have_css('a.button', "Download Resume")
  end

  it 'has a testimonial by Harry Potter' do
    expect(page).to have_css('cite', text: 'Harry Potter')
  end

  it 'has a section with the id of contact' do
    expect(page).to have_css('section#contact')
  end

  it "has an h1 tag with the content 'client testimonials'" do
    within ('#testimonials h1') do
      expect(page).to have_content('Client Testimonials')
    end
  end

end
