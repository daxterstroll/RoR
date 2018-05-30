class Search < ActiveRecord::Base
  belongs_to :category

  def search_items
    items = Item.order(:name)
    items = items.where("name LIKE ?", "%#{keywords}%") if keywords.present?
    items = items.where(category_id: category_id) if category_id.present?
    items = FiltersValue.find(filters_value_id).items if filters_value_id.present?

    return items
  end
end