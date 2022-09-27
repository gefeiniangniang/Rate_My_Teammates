class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
