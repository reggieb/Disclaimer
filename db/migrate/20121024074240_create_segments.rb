class CreateSegments < ActiveRecord::Migration
  def change
    create_table :disclaimer_segments do |t|
      t.string :name
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
