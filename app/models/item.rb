class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user

  scope :five_per_category, -> {
    from('(SELECT *, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY category_id) FROM items) AS items').where('row_number <= 5')
  }
end
