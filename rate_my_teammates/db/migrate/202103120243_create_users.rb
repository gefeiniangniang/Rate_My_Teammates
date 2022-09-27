class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :uni, index: true, null: false
      t.string :name
      t.integer :self_time_management, :default => 0
      t.integer :self_critical_thinking, :default => 0
      t.integer :self_collaboration, :default => 0
      t.integer :self_communication, :default => 0
      t.integer :self_reliability, :default => 0
      t.text :description
      t.text :summary  
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
