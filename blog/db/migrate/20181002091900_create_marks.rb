class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.integer :mark
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
