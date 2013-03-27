require 'spec_helper'

describe "Authors", js: true do
  context "when logged in" do
    it "creates an author" do

      # Login

      Author.create username: "admin", password: "admin"

      visit "/login"

      fill_in "username", with: "admin"
      fill_in "password", with: "admin"
      click_button "Login"

      visit "/authors"

      expect {
        click_link "New Author"

        fill_in "Username", with: "Wolverine"
        fill_in "Email", with: "SnicktySnick@xmen.com"
        fill_in "author_password", with: "jeangrey"
        # find("#author_password").set "jeangrey"
        fill_in "Password confirmation", with: "jeangrey"
        click_button "Create Author"
      }.to change(Author, :count).by(1)
    end

    it "deletes a user" do

        Author.create username: 'admin', password: 'admin'
        author = Author.create username: 'another', password: 'another'

        visit "/login"
        fill_in "Username", with: "admin"
        fill_in "Password", with: "admin"
        click_button "Login"

        visit "/authors"
        expect {

          within "#author_#{author.id}" do
            click_link 'Destroy'
          end

          alert = page.driver.browser.switch_to.alert
          alert.accept

          sleep 1

        }.to change(Author,:count).by(-1)

      end


  end

end