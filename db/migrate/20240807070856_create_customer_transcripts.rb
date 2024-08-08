class CreateCustomerTranscripts < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_transcripts do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
