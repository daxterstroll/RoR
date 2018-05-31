class CreateJoinTableCategoriesFilters < ActiveRecord::Migration
  def change
    create_join_table :categories, :filters do |t|
      t.index %i[category_id filter_id]
      t.index %i[filter_id category_id]
    end
  end
end
