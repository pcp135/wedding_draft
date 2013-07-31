require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    
    it "should have the content 'Welcome to our Wedding Website'" do
      visit '/static_pages/home'
      expect(page).to have_content('Welcome to our Wedding Website')
    end

  end
  
  describe "Program Page" do

    it "should have a title 'Program'" do
      visit '/static_pages/program'
      expect(page).to have_content('Program')
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
      
end
