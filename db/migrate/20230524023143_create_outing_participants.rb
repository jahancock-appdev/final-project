class CreateOutingParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :outing_participants do |t|
      t.integer :outing_id
      t.integer :user_id
      t.boolean :participant_submitted

      t.timestamps
    end
  end
end
