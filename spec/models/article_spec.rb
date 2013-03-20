require 'spec_helper'

describe Article do

  context "when it has a title and body" do
    let(:subject) { Article.new(title: "title", body: "body") }

    it "is valid" do
      expect(subject).to be_valid
    end
  end

  context "when missing a title" do
    let(:subject) { Article.new(title: nil) }

    it "is invalid" do
      expect(subject).to be_invalid
    end

    it "has errors" do
      expect(subject).to have(1).errors_on(:title)
    end
  end

  context "when missing a body"

  describe "#tag_list" do
    context "when the article has no tags" do
      it "returns an empty string"
    end

    context "when the article has one tag" do

      it "returns a string with the one tag" do
        subject.tags.build name: 'school'
        expect(subject.tag_list).to eq "school"
      end
    end

    context "when the article has more than one tag" do
      it "returns a comma-delimited string of all the tag names"
    end
  end

  describe "#tag_list=" do

    context "when given nil" do
      it "sets tags to an empty array"
    end

    context "when given an emptry string" do
      it "sets tags to an empty array"
    end

    context "when given the tag string 'first, second, third'" do
      it "sets the tags with the specified tag names" do
        subject.tag_list = "first, second, third"
        expect(subject.tag_list).to eq "first, second, third"
      end
    end

    context "when given the tag string 'First, Second, Third'" do
      it "sets the tags with the specified tag names"
    end

    context "when given the tag string 'first,second,third'" do
      it "sets the tags with the specified tag names"
    end

    context "when given the tag string 'first,second,    third'" do
      it "sets the tags with the specified tag names"
    end

  end

end