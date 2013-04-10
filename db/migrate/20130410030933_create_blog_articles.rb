class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.references :blog
      t.references :article

      t.timestamps
    end
    add_index :blog_articles, :blog_id
    add_index :blog_articles, :article_id
  end
end
