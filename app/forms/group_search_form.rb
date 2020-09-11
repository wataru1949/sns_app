class GroupSearchForm
  include ActiveModel::Model
  include StringNormalizer
  
  attr_accessor :group_name, :category, :prefecture_id, :city

  def search
    normalize_values
    
    rel = Group
    if group_name.present? ||category.present? || prefecture_id.present? || city.present?
      if group_name.present?
        rel = rel.where(group_name: group_name)
      end

      if category.present?
        rel = rel.joins(:category)
        rel = rel.where("categories.value" => category)
      end

      if prefecture_id.present? || city.present?
        rel = rel.joins(:group_address)
        if prefecture_id.present?
          rel = rel.where("addresses.prefecture_id" => prefecture_id)
        end

        rel = rel.where("addresses.city" => city) if city.present?
      end

      rel = rel.distinct
      
      rel.group_listing
    else
      rel = rel.where(group_name: nil)
    end
  end

  private def normalize_values
    self.group_name = normalize_as_generic(group_name)
    self.category = normalize_as_generic(category)
    self.city = normalize_as_generic(city)
  end
end
