class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :actionType
      t.references :user, foreign_key: true
      t.references :activable, polymorphic: true
      t.integer :tag_user_id
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
