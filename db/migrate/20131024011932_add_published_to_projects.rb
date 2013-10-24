class AddPublishedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :published, :booleon
  end
end
