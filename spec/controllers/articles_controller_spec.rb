require 'spec_helper'

describe ArticlesController do

  describe 'GET #index' do

    ### NOTICE the use of let! instead of just using let
    let!(:articles) { [ Article.create(title: "title", body: "body") ] }

    it "populates an array of articles" do
      get :index
      expect(assigns(:articles)).to match_array articles
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let!(:article) { Article.create(title: "title", body: "body") }

    it "assigns the requested article to @article" do
      get :show, id: article.id
      expect(assigns(:article)).to eq article
    end

    it "renders the :show template" do
      get :show, id: article.id
      expect(response).to render_template :show
    end
  end

  context "when a user is logged in" do
    before do
      controller.stub(:require_login).and_return(true)
    end

    describe 'GET #new' do
      it "assigns a new Article to @article" do
        get :new
        expect(assigns(:article)).to be_kind_of(Article)
      end

      it "renders the :show template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context "with valid attributes" do

        let(:valid_attributes) do
          { article: { title: "title", body: "body" } }
        end

        it "saves the new article in the database" do
          expect {
            post :create, valid_attributes
          }.to change(Article, :count).by(1)
        end

        it "redirects to back to the article show page" do
          post :create, valid_attributes
          expect(response).to redirect_to( article_path(assigns(:article)) )
        end
      end

      context "with invalid attributes" do

        let(:invalid_attributes) do
          { article: { title: "title", body: nil } }
        end

        it "does not save the new article in the database"

        it "renders the :new template"
      end
    end

    describe 'GET #edit' do
      it "assigns the requested article to @article"
      it "renders the :edit template"
    end

    describe 'PUT #update' do

      context "with valid attributes" do

        let!(:article) { Article.create(title: "title", body: "body") }

        let(:updated_attributes) do
          { id: article.id,
            article: {
              title: "title_has_been_updated",
              body: "body"
            }
          }
        end

        it "changes the article's attributes" do
          put :update, updated_attributes
          article.reload
          expect(article.title).to eq "title_has_been_updated"
        end

        it "redirects to the updated article"
      end

      context "with invalid attributes" do

        let!(:article) { Article.create(title: "title", body: "body") }

        let(:updated_attributes) do
          { id: article.id,
            article: {
              title: "title_has_been_updated",
              body: nil
            }
          }
        end

        it "does not change the article's attributes"
        it "re-renders the edit method"
      end
    end

    describe 'DELETE #destroy' do
      let!(:article) { Article.create(title: "title", body: "body") }
      it "deletes the article"
      it "redirects to the articles index"
    end

  end

  context 'when a user is not logged in' do

    describe 'GET #new' do
      it "redirects to login" do
        get :new
        expect(response).to redirect_to(login_path)
      end
    end

    describe 'POST #create' do
      it "redirects to login"
    end

    describe 'GET #edit' do
      it "redirects to login"
    end

    describe 'PUT #update' do
      it "redirects to login"
    end

    describe 'DELETE #destroy' do
      it "redirects to login"
    end

  end


end
