class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :outing_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
