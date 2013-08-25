require 'spec_helper'

describe "Authentication" do
  subject { page}
  describe "signin page" do
    before {visit signin_path(locale: :en ) }
    it {should have_content('Sign in')}
    it {should have_title('Sign in')}
  end
  describe "signin" do
    before {visit signin_path(locale: :en ) }
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
      before { sign_in user }
      it {should have_title('Welcome to our Wedding Website') }
      it {should have_link('Sign out')}
      it {should_not have_link('Sign in')}
      it {should_not have_link('Register')}
      it {should have_link('Users', users_url(:en))}
      describe "visiting the users index" do
        before { visit users_path(locale: :en)}
        describe "with non-admin access" do
          it {should have_title("Welcome to our Wedding Website")}
        end
        describe "with admin access" do
          before do
            @user = User.new(name: "Example User", email: "user@example.com",
            password: "foobar", password_confirmation: "foobar")
            @user.save!
            @user.toggle!(:admin)
            sign_in @user
            visit users_path(locale: :en)
          end
          it {should have_title("All users")}          
        end        
      end
      describe "followed by signout" do
        before { click_link "Sign out"}
        it {should have_link('Sign in')}
        it {should have_link('Register')}
      end
    end
  end
  describe "authorization" do
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user)}
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com")}
      before { sign_in user, no_capybara: true}
      describe "visiting the users edit page" do
        before {visit edit_user_path(:en, wrong_user)}
        it {should_not have_title('Edit user')}
      end
      describe "submitting a patch request to users update action" do
        before {patch user_path(:en, wrong_user)}
        specify { expect(response).to redirect_to(home_path(:en))}
      end
    end
    describe "for non-signed in users" do
      describe "in the Users controller" do
        describe "visiting the users index" do
          before { visit users_path(locale: :en)}
          it {should have_title("Sign in")}
        end
      end
      let(:user) { FactoryGirl.create(:user)}
      describe "in the users controller " do
        describe "visiting the edit page" do
          before {visit edit_user_path(:en, user)}
          it {should have_title('Sign in')}
        end
        describe "submitting to the update action" do
          before {patch user_path(:en, user)}
          specify { expect(response).to redirect_to(signin_path(:en))}
        end
      end
      describe "in the static pages" do
        describe "visiting the program page" do
          before { visit program_path(locale: :en)}
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
