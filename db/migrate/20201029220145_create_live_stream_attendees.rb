class CreateLiveStreamAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :live_stream_attendees do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
