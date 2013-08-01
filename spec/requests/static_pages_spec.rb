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
  
  describe "Locations Page" do
    
    it "should have a header 'Locations'" do
      visit '/static_pages/locations'
      expect(page).to have_content('Locations')
    end
    it "should have a title 'Locations'" do
      visit '/static_pages/locations'
      expect(page).to have_title('Locations')
    end
    it "should mention Burg Schwarzenstein" do
      visit '/static_pages/locations'
      expect(page).to have_content('Burg Schwarzenstein')
    end
    it "should mention Hotel" do
      visit '/static_pages/locations'
      expect(page).to have_content('hotel')
    end
    it "should mention Airport" do
      visit '/static_pages/locations'
      expect(page).to have_content('Airport')
    end
    
  end
  
  describe "Hotels Page" do
    
    it "should have a header 'Hotels'" do
      visit '/static_pages/hotels'
      expect(page).to have_content('Hotels')
    end
    it "should have a title 'Hotels'" do
      visit '/static_pages/hotels'
      expect(page).to have_title('Hotels')
    end
    it "should mention Schwarzenstein" do
      visit '/static_pages/hotels'
      expect(page).to have_content('Schwarzenstein')
    end
    it "should mention Strieth" do
      visit '/static_pages/hotels'
      expect(page).to have_content('Strieth')
    end
    it "should mention FB Schönleber" do
      visit '/static_pages/hotels'
      expect(page).to have_content('FB Schönleber')
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
  
  describe "The Region Page" do
    
    it "should have a header 'The Region'" do
      visit '/static_pages/region'
      expect(page).to have_content('The Region')
    end
    it "should have a title 'The Region'" do
      visit '/static_pages/region'
      expect(page).to have_title('The Region')
    end
    it "should mention Rhein" do
      visit '/static_pages/region'
      expect(page).to have_content('Rhein')
    end
    it "should mention vineyards" do
      visit '/static_pages/region'
      expect(page).to have_content('vineyards')
    end
    it "should mention cruise" do
      visit '/static_pages/region'
      expect(page).to have_content('cruise')
    end
    it "should mention bike" do
      visit '/static_pages/region'
      expect(page).to have_content('bike')
    end
    
  end
  
  describe "Registry Page" do
    
    it "should have a header 'Gift Registry'" do
      visit '/static_pages/registry'
      expect(page).to have_content('Gift Registry')
    end
    it "should have a title 'Gift Registry'" do
      visit '/static_pages/registry'
      expect(page).to have_title('Gift Registry')
    end
    it "should apologise for not being ready yet" do
      visit '/static_pages/registry'
      expect(page).to have_content("Sorry, we've not had a chance to organise this yet, please check back later")
    end

  end
      
  describe "RSVP Page" do
    
    it "should have a header 'RSVP'" do
      visit '/static_pages/rsvp'
      expect(page).to have_content('RSVP')
    end
    it "should have a title 'RSVP'" do
      visit '/static_pages/rsvp'
      expect(page).to have_title('RSVP')
    end
    it "should mention a few questions" do
      visit '/static_pages/rsvp'
      expect(page).to have_content("we put together a few questions for you")
    end

  end

  describe "RSVP Page" do
    
    it "should have a header 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Us')
    end
    it "should have a title 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_title('Contact Us')
    end
    it "should mention Phil's email" do
      visit '/static_pages/contact'
      expect(page).to have_content("phil@parsons.uk.com")
    end
    it "should mention Stef's email" do
      visit '/static_pages/contact'
      expect(page).to have_content("steffihense@gmail.com")
    end
    it "should mention questions" do
      visit '/static_pages/contact'
      expect(page).to have_content("questions")
    end

  end
end
