class CreatePostTranslations < ActiveRecord::Migration
  def up
    Post.create_translation_table!({
      name: :string,
      content: :text
    },  {
      migrate_date:true
    })
  end

  def down
    Post.drop_translation_table! migrate_data: true
  end
end
