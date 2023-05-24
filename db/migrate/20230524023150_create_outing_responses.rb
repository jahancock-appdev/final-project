class CreateOutingResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :outing_responses do |t|
      t.integer :option_id
      t.integer :participant_id
      t.boolean :participant_selected

      t.timestamps
    end
  end
end
