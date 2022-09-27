class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.references :skill, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
