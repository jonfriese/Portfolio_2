class AddProjectTable < ActiveRecord::Migration
  def change
    create_table :projects, :id => true do |t|
      t.string :name
      t.text :technologies_used
      t.integer :author_id
      t.boolean :published
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
