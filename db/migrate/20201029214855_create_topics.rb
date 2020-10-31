class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :questions
    end
  end
end
