class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_enum :inventory_visibility, ['public', 'private']

    create_table :categories do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :categories, :title, unique: true

    create_table :inventories do |t|
      t.string :title, null: false
      t.text   :description
      t.enum   :visibility,
                enum_type: :inventory_visibility,
                default: 'private',
                null: false
      t.references :category, foreign_key: true
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end

    create_table :tags do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :tags, :title, unique: true

    create_table :inventory_tags do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :tag,       null: false, foreign_key: true
      t.timestamps
    end
    add_index :inventory_tags, [:inventory_id, :tag_id], unique: true
  end
end
