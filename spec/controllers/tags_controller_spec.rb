require 'spec_helper'

describe TagsController do

  describe 'GET #index' do
    it "populates an array of tags"
    it "renders the :index view"
  end

  describe 'GET #show' do
    context "when the tag exists by name" do
      it "assigns the requested tag to @tag"
      it "renders the :show view"
    end

    context "when the tag exists by id" do
      it "assigns the requested tag to @tag"
      it "renders the :show view"
    end

    context "when the tag does not exist by name or id" do
      it "redirects to the tags index page"
    end
  end

end
