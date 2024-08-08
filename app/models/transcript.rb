class Transcript < ApplicationRecord
  self.table_name = 'customer_transcripts'
  belongs_to :customer
end
