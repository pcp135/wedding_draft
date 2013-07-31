require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    
    it "should have the content 'Welcome to our Wedding Website'" do
      visit '/static_pages/home'
      expect(page).to have_content('Welcome to our Wedding Website')
    end


  end
end
