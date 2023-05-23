class CreateOutings < ActiveRecord::Migration[6.0]
  def change
    create_table :outings do |t|
      t.string :status

      t.timestamps
    end
  end
end
