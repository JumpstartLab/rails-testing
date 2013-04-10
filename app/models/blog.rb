class Blog < ActiveRecord::Base
  attr_accessible :name, :path
  has_many :blog_articles
  has_many :articles, through: :blog_articles

  def to_param
    path
  end
end
