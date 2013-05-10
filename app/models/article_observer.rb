class ArticleObserver < ActiveRecord::Observer

  def after_save(model)
    clear_cache
  end

  def after_destroy(model)
    clear_cache
  end

  def cache_keys
    [ 'articles-all', 'top-articles' ]
  end

  def clear_cache
    puts %{

    ***************************************
    CLEARING CACHE
    ***************************************
    }
    cache_keys.each {|key| Rails.cache.delete(key) }
  end

end