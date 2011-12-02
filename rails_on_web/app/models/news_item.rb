class NewsItem < ActiveRecord::Base
  belongs_to :news_cate

  def self.recent(count)
    NewsItem.order("updated_at DESC").limit(count)
  end
end
