class CreateSpacs < ActiveRecord::Migration[6.0]
  def change
    create_table :spacs do |t|
      t.string :ticker
      t.string :name
      t.string :target
      t.date :definitive_agreement
      t.date :preliminary_filing
      t.date :first_revision
      t.date :second_revision
      t.date :third_revision
      t.date :definitive_filing
      t.date :merger_meeting
      t.string :expected_close
      t.string :investor_presentation_url

      t.timestamps
    end
  end
end
