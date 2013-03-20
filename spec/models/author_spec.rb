require 'spec_helper'

describe Author do

  context "when the password matches the password confirmation" do
    it "is valid" do
      subject.password = "Pee-Wee Herman"
      subject.password_confirmation = "Pee-Wee Herman"
      expect(subject).to be_valid
    end
  end

  context "when the password does not match the password confirmation" do
    it "is invalid"
    it "has errors"
  end

end
