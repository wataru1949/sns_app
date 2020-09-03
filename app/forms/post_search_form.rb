class PostSearchForm
  include ActiveModel::Model

  attr_accessor :category, :event_date, :prefecture_id, :city

  def search
    rel = Post

    if category.present?
      rel = rel.joins(:category)
      rel = rel.where("categories.value" => category)
    end

    if event_date.present?
      rel = rel.where(event_date: event_date)
    end

    if prefecture_id.present? || city.present?
      rel = rel.joins(:post_address)
      if prefecture_id.present?
        rel = rel.where("addresses.prefecture_id" => prefecture_id)
      end

      rel = rel.where("addresses.city" => city) if city.present?
    end

    rel = rel.distinct
    
    rel.post_listing
  end
end
