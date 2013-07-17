class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :guid
      t.string :ident
      t.integer :user_id

      t.timestamps
    end
  end
end
