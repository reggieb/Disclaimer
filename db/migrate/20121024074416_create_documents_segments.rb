class CreateDocumentsSegments < ActiveRecord::Migration
  def change
    create_table :disclaimer_documents_segments, :id => false do |t|
      t.integer :document_id
      t.integer :segment_id
    end
  end
end
