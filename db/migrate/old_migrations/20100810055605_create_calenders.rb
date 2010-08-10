class CreateCalenders < ActiveRecord::Migration
  def self.up
    create_table :calenders do |t|
      t.string :title
      t.date :published_on
      t.timestamps
    end
  end

  def self.down
    drop_table :calenders
  end
end

