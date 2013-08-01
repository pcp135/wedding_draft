require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    before { visit root_path }
    it "should have the content 'Welcome to our Wedding Website'" do
      expect(page).to have_content('Welcome to our Wedding Website')
    end
    it "should have the title 'Welcome to our Wedding Website'" do
      expect(page).to have_title('Welcome to our Wedding Website')
    end

  end
  
  describe "Program Page" do
    before { visit program_path }
    it "should have a title 'Program'" do
      expect(page).to have_content('Program')
    end
    it "should have a title 'Wedding Program'" do
      expect(page).to have_title('Wedding Program')
    end
    it "should mention Friday" do
      expect(page).to have_content('Friday')
    end
    it "should mention Saturday" do
      expect(page).to have_content('Saturday')
    end
    it "should mention Sunday" do
      expect(page).to have_content('Sunday')
    end
    
  end
  
  describe "Locations Page" do
    before { visit locations_path }
    it "should have a header 'Locations'" do
      expect(page).to have_content('Locations')
    end
    it "should have a title 'Locations'" do
      expect(page).to have_title('Locations')
    end
    it "should mention Burg Schwarzenstein" do
      expect(page).to have_content('Burg Schwarzenstein')
    end
    it "should mention Hotel" do
      expect(page).to have_content('hotel')
    end
    it "should mention Airport" do
      expect(page).to have_content('Airport')
    end
    
  end
  
  describe "Hotels Page" do
    before { visit hotels_path }
    it "should have a header 'Hotels'" do
      expect(page).to have_content('Hotels')
    end
    it "should have a title 'Hotels'" do
      expect(page).to have_title('Hotels')
    end
    it "should mention Schwarzenstein" do
      expect(page).to have_content('Schwarzenstein')
    end
    it "should mention Strieth" do
      expect(page).to have_content('Strieth')
    end
    it "should mention FB Schönleber" do
      expect(page).to have_content('FB Schönleber')
    end
    
  end
  
  describe "German vs English Page" do 
    before { visit germanvsenglish_path }
    it "should have a title 'German vs English'" do
      expect(page).to have_content('German vs English')
    end
    it "should have a title 'German vs English Weddings'" do
      expect(page).to have_title('German vs English Weddings')
    end
    it "should talk about the ceremony" do
      expect(page).to have_content('ceremony')
    end
    it "should mention outfits" do
      expect(page).to have_content('outfits')
    end
    it "should talk about the break" do
      expect(page).to have_content('break')
    end
  end
  
  describe "The Region Page" do
    before { visit region_path }
    it "should have a header 'The Region'" do
      expect(page).to have_content('The Region')
    end
    it "should have a title 'The Region'" do
      expect(page).to have_title('The Region')
    end
    it "should mention Rhein" do
      expect(page).to have_content('Rhein')
    end
    it "should mention vineyards" do
      expect(page).to have_content('vineyards')
    end
    it "should mention cruise" do
      expect(page).to have_content('cruise')
    end
    it "should mention bike" do
      expect(page).to have_content('bike')
    end
    
  end
  
  describe "Registry Page" do
    before { visit registry_path }
    it "should have a header 'Gift Registry'" do
      expect(page).to have_content('Gift Registry')
    end
    it "should have a title 'Gift Registry'" do
      expect(page).to have_title('Gift Registry')
    end
    it "should apologise for not being ready yet" do
      expect(page).to have_content("Sorry, we've not had a chance to organise this yet, please check back later")
    end

  end
      
  describe "RSVP Page" do
    before { visit rsvp_path }
    it "should have a header 'RSVP'" do
      expect(page).to have_content('RSVP')
    end
    it "should have a title 'RSVP'" do
      expect(page).to have_title('RSVP')
    end
    it "should mention a few questions" do
      expect(page).to have_content("we put together a few questions for you")
    end

  end

  describe "Contact Page" do
    before { visit contact_path }
    it "should have a header 'Contact Us'" do
      expect(page).to have_content('Contact Us')
    end
    it "should have a title 'Contact Us'" do
      expect(page).to have_title('Contact Us')
    end
    it "should mention Phil's email" do
      expect(page).to have_content("phil@parsons.uk.com")
    end
    it "should mention Stef's email" do
      expect(page).to have_content("steffihense@gmail.com")
    end
    it "should mention questions" do
      expect(page).to have_content("questions")
    end

  end
end
