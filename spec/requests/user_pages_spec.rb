require 'spec_helper'

describe "UserPages" do
  subject {page}
  describe "Registration Page" do
    before {visit registration_path}
    it { should have_content('Register') }
    it { should have_title('Register') } 
  end
end
