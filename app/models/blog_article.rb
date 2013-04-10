class BlogArticle < ActiveRecord::Base
  belongs_to :blog
  belongs_to :article
  # attr_accessible :title, :body
end
