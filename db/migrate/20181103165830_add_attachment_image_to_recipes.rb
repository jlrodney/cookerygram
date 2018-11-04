class AddAttachmentImageToRecipes < ActiveRecord::Migration[5.2]
  def self.up
    change_table :recipes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :recipes, :image
  end
end
