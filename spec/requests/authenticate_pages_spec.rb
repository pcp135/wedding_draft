require 'spec_helper'

describe "Authentication" do
  subject { page}
  describe "signin page" do
    before {visit signin_path }
    it {should have_content('Sign in')}
    it {should have_title('Sign in')}
  end
  describe "signin" do
    before {visit signin_path }
    describe "with invalid information" do
      before {click_button "Sign in"}
      it {should have_title('Sign in')}
      it {should have_selector('div.alert.alert-error', text: "Invalid")}
      describe "after visiting another page" do
        before {click_link "Register"}
        it {should_not have_selector('div.alert.alert-error')}
      end
    end
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      it {should have_title('Welcome to our Wedding Website') }
      it {should have_link('Sign out', href: signout_path)}
      it {should_not have_link('Sign in', href: signin_path)}
      it {should_not have_link('Register', href: registration_path)}
      describe "followed by signout" do
        before { click_link "Sign out"}
        it {should have_link('Sign in', href: signin_path)}
        it {should have_link('Register', href: registration_path)}
      end
    end
  end
  describe "authorization" do
    describe "for non-signed in users" do
      let(:user) { FactoryGirl.create(:user)}
      describe "in the static pages" do
        describe "visiting the program page" do
          before { visit program_path }
          it {should have_title('Sign in')}
          describe "after signing in" do
            before do 
              fill_in "Email", with: user.email
              fill_in "Password", with: user.password
              click_button "Sign in"
            end
            it "should render the desired protected page" do
              expect(page).to have_title('Program')
            end
          end 
        end
      end
    end
  end
end
