class CreateOutingOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :outing_options do |t|
      t.integer :outing_id
      t.integer :restaurant_id
      t.boolean :all_participants_selected
      t.integer :responses_count

      t.timestamps
    end
  end
end
