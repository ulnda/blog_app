class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
