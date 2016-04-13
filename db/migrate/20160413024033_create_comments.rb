class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body,           null: false
      t.integer :revision,    null: false, default: 0
      t.references :story,    null: false

      t.timestamps null: false
    end

    add_column :users, :username, :string, after: :id, null: false, default: 'derp'
  end
end
