class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
    Category.create!(:title => "Category 1")
  end

  def self.down
    drop_table :categories
  end
end

