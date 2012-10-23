class CreateDisclaimerDocuments < ActiveRecord::Migration
  def change
    create_table :disclaimer_documents do |t|
      t.string :title
      t.text :header
      t.text :footer

      t.timestamps
    end
  end
end
