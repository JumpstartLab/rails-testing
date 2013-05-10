module Cache

  def self.articles_data
    { all_key: "articles-all", all_time: 60.minutes }
  end

  def self.articles
    OpenStruct.new articles_data
  end
end