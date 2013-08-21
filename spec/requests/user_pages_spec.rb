require 'spec_helper'

describe "UserPages" do
  subject {page}
  describe "Registration Page" do
    before {visit registration_path}
    it { should have_content('Register') }
    it { should have_title('Register') } 
  end
  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(user)}
    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end
end

