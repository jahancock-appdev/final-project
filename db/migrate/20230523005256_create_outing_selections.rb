class CreateOutingSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :outing_selections do |t|
      t.integer :option_id
      t.integer :invitation_id
      t.string :status

      t.timestamps
    end
  end
end
