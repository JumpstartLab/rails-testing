require 'spec_helper'

describe "Author Management", js: true do
  describe "creating a user" do
    context "when logged in" do
      it "creates a user" do

        Author.create username: 'admin', password: 'admin'

        visit "/login"
        fill_in "Username", with: "admin"
        fill_in "Password", with: "admin"
        click_button "Login"

        visit "/authors"

        expect{
          click_link 'New Author'

          fill_in "Username", with: "DonDraper"
          fill_in "Email", with: "don@stanleycooperdraperprice.com"
          # fill_in "Password", with: "MadMoney"
          find("#author_password").set "MadMoney"
          fill_in "Password confirmation", with: "MadMoney"
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
end