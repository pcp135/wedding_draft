require 'spec_helper'

describe "UserPages" do
  subject {page}
  describe "edit" do
    let(:user) {FactoryGirl.create(:user)}
    before do 
      sign_in user
      visit edit_user_path(:en, user)
    end
    it { should have_content('Update your profile')}
    it { should have_title("Edit user")}
    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error')}
    end
    describe "with valid information" do
      let(:new_name) {"New Name"}
      let(:new_email) {"new@example.com"}
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Password confirmation", with: user.password
        click_button "Save changes"
      end
      it {should have_title(new_name)}
      it {should have_selector('div.alert.alert-success')}
      it {should have_link("Sign out")}
      specify {expect(user.reload.name).to eq new_name}
      specify {expect(user.reload.email).to eq new_email}
    end
  end
  describe "index" do
    let(:user) {FactoryGirl.create(:user)}
    before do 
      sign_in user
      user.toggle!(:admin)
      visit users_path(locale: :en) 
    end
    it { should have_title "All Users"}
    it { should have_content "All Users"}
  end
  describe "Registration Page" do
    before {visit registration_path(locale: :en )}
    it { should have_content('Register') }
    it { should have_title('Register') } 
  end
  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(:en, user)}
    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end
  describe "Signup" do
    before {visit registration_path(locale: :en )}
    let(:submit) { "Create my account"}
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com')}
        it { should have_link('Sign out')}
        it { should have_selector('div.alert.alert-success', text: "Welcome")}
      end
    end
  end
end

