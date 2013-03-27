require 'spec_helper'

describe "Logging In", js: true do
  describe "when I visit the login page" do
    context "when logging with the correct username and password" do
      it "redirects me to the articles index" do
        Author.create username: 'admin', password: 'admin'

        visit "/login"
        fill_in "Username", with: "admin"
        fill_in "Password", with: "admin"
        click_button "Login"

        title_text = page.find(:xpath, '//h1').text
        expect(title_text).to eq "Articles"

      end
    end
  end

end