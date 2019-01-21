class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.1]
  def change
   # add_column :blogs, :topic, :string
    #add_column :blogs, :references, :string
    add_reference :blogs, :topic, foreign_key: true
  end
end
