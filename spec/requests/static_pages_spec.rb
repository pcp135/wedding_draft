require 'spec_helper'

describe "StaticPages" do
  subject { page }
  before {visit signin_path(locale: :en ) }
  describe "with signed in user" do
    let(:user) { FactoryGirl.create(:user)}
    before do
      fill_in "Email", with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
    end
    describe "Home Page" do
      before { visit home_path(locale: :en ) }
      it { should have_content('Welcome to our Wedding Website') }
      it { should have_title('Welcome to our Wedding Website') }
    end
  
    describe "Program Page" do
      before { visit program_path(locale: :en ) }
      it {should have_content('Program')}
      it {should have_title('Wedding Program')}
      it {should have_content('Friday')}
      it {should have_content('Saturday')}
      it {should have_content('Sunday')}
    end
  
    describe "Locations Page" do
      before { visit locations_path(locale: :en ) }
      it {should have_content('Locations')}
      it {should have_title('Locations')}
      it {should have_content('Burg Schwarzenstein')}
      it {should have_content('hotel')}
      it {should have_content('Airport')}
    end
  
    describe "Hotels Page" do
      before { visit hotels_path(locale: :en ) }
      it {should have_content('Hotels')}
      it {should have_title('Hotels')}
      it {should have_content('Schwarzenstein')}
      it {should have_content('Strieth')}
      it {should have_content('FB Schönleber')    }
    end
  
    describe "German vs English Page" do 
      before { visit germanvsenglish_path(locale: :en ) }
      it {should have_content('German vs English')}
      it {should have_title('German vs. English Weddings')}
      it {should have_content('ceremony')}
      it {should have_content('outfits')}
      it {should have_content('break')}
    end
  
    describe "The Region Page" do
      before { visit region_path(locale: :en ) }
      it {should have_content('The Region')}
      it {should have_title('The Region')}
      it {should have_content('Rhein')}
      it {should have_content('vineyards')}
      it {should have_content('cruise')}
      it {should have_content('bike')}
    end
  
    describe "Registry Page" do
      before { visit registry_path(locale: :en ) }
      it {should have_content('Gift Registry')}
      it {should have_title('Gift Registry')}
      it {should have_content("list of things we would really enjoy")}
    end
      
    describe "RSVP Page" do
      before { visit rsvp_path(locale: :en ) }
      it {should have_content('RSVP')}
      it {should have_title('RSVP')}
      it {should have_content("we put together a few questions for you")}
    end

    describe "Contact Page" do
      before { visit contact_path(locale: :en ) }
      it {should have_content('Contact Us')}
      it {should have_title('Contact Us')}
      it {should have_content("phil@parsons.uk.com")}
      it {should have_content("steffihense@gmail.com")}
      it {should have_content("questions")}
    end
  end
end