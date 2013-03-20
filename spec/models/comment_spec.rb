require 'spec_helper'

describe Comment do

  context "when it has an author and body" do
    it "is valid"
  end

  context "when missing an author" do
    it "is invalid"
    it "has errors"
  end

  context "when missing a body" do
    it "is invalid"
    it "has errors"
  end

end
