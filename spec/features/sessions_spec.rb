require 'spec_helper'

describe "Sessions", js: true do
  context "when logging in" do
    context "when using the correct username and password" do
      it "logins the user in the website" do

        Author.create username: "admin", password: "admin"

        visit "/login"

        fill_in "username", with: "admin"
        fill_in "password", with: "admin"
        click_button "Login"

        page.should have_content 'Logged in as admin'
        expect(current_path).to eq articles_path
      end
    end
  end

end