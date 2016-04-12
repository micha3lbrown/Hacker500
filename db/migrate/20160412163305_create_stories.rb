class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :external_id,   null: false, default: 0
      t.string  :title,         null: false, default: ""
      t.text    :url,           null: false
      t.integer :points,        null: false, default: 0
      t.integer :hn_score,      null: false, default: 0
      t.integer :active_group,  null: false, default: 0

      t.timestamps null: false
    end

    add_index :stories, :external_id, unique: true
  end
end
