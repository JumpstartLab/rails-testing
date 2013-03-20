require 'spec_helper'

describe CommentsController do

  describe 'POST #create' do
    context 'with valid attributes' do
      it "creates a comment in the database"
      it "redirects back to the article"
    end

    context 'with invalid attributes' do
      it "does not create a comment in the database"
      it "assigns the article to @article"
      it "renders the articles/show page"
    end
  end

end
