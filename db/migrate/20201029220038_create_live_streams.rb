class CreateLiveStreams < ActiveRecord::Migration[6.0]
  def change
    create_table :live_streams do |t|
      t.datetime :start_date_time
      t.references :topic, null: false, foreign_key: true
    end
  end
end
