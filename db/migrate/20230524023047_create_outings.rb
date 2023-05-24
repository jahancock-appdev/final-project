class CreateOutings < ActiveRecord::Migration[6.0]
  def change
    create_table :outings do |t|
      t.boolean :completed
      t.integer :sender_id
      t.integer :outing_participants_count

      t.timestamps
    end
  end
end
