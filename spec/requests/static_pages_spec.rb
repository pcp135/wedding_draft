require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    
    it "should have the content 'Welcome to our Wedding Website'" do
      visit '/static_pages/home'
      expect(page).to have_content('Welcome to our Wedding Website')
    end
    it "should have the title 'Welcome to our Wedding Website'" do
      visit '/static_pages/home'
      expect(page).to have_title('Welcome to our Wedding Website')
    end

  end
  
  describe "Program Page" do

    it "should have a title 'Program'" do
      visit '/static_pages/program'
      expect(page).to have_content('Program')
    end
    it "should have a title 'Wedding Program'" do
      visit '/static_pages/program'
      expect(page).to have_title('Wedding Program')
    end
    it "should mention Friday" do
      visit '/static_pages/program'
      expect(page).to have_content('Friday')
    end
    it "should mention Saturday" do
      visit '/static_pages/program'
      expect(page).to have_content('Saturday')
    end
    it "should mention Sunday" do
      visit '/static_pages/program'
      expect(page).to have_content('Sunday')
    end
    
  end
  
  describe "German vs English Page" do 
    
    it "should have a title 'German vs English'" do
      visit '/static_pages/germanvsenglish'
      expect(page).to have_content('German vs English')
    end
    it "should have a title 'German vs English Weddings'" do
      visit '/static_pages/germanvsenglish'
      expect(page).to have_title('German vs English Weddings')
    end
    it "should talk about the ceremony" do
      visit '/static_pages/germanvsenglish'
      expect(page).to have_content('ceremony')
    end
    it "should mention outfits" do
      visit '/static_pages/germanvsenglish'
      expect(page).to have_content('outfits')
    end
    it "should talk about the break" do
      visit '/static_pages/germanvsenglish'
      expect(page).to have_content('break')
    end
  end
      
end
