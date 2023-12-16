class CreateSends < ActiveRecord::Migration[6.1]
  def change
    create_table :sends do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :workpost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
