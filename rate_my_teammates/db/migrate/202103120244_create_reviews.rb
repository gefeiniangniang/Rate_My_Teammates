class CreateReviews < ActiveRecord::Migration
  # def up
  #   create_table :reviews, force: :cascade do |t|
  #     t.string :content
  #     t.string :class_taken_together
  #     t.string :user_uni, null: false
  #     t.string :reviewer_uni, null: false
  #     t.index :user_uni, name: "index_reviews_on_user_uni"
  #     t.index :reviewer_uni, name: "index_reviews_on_reviewer_uni"
  #     t.datetime :created_at, precision: 6, null: false
  #     t.datetime :updated_at, precision: 6, null: false
  #   end
  # end
  #
  # def down
  #   drop_table :review
  # end

  def change
    create_table :reviews do |t|
      t.string :reviewer_uni, null: false
      t.text :content, null: false
      t.string :course_taken_together
      t.integer :time_management
      t.integer :critical_thinking
      t.integer :collaboration
      t.integer :communication
      t.integer :reliability
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
