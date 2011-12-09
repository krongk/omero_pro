class NewsItem < ActiveRecord::Base
  belongs_to :news_cate

  def self.recent(count, cate = 0)
    if cate > 0
       NewsItem.where(:news_cate_id => cate).order("updated_at DESC").limit(count)
    else
       NewsItem.order("updated_at DESC").limit(count)
    end
  end
end
