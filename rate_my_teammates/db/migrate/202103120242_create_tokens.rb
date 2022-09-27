class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :login_token, null: false
      t.string :uni 
      t.timestamps :token_generated_at
    end
  end
end
