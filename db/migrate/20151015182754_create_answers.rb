class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :post_id
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
