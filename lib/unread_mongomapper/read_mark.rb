class ReadMark
  include MongoMapper::Document; safe

  belongs_to :readable, polymorphic: true
  belongs_to :reader, polymorphic: true

  validates_presence_of :reader_id, :reader_type, :readable_id, :readable_type
  validates_uniqueness_of :reader_id, scope: [:reader_type, :readable_id, :readable_type]

  ensure_index :readable_id
  ensure_index :reader_id

end
