require 'test/unit'
require 'mongo_mapper'
require 'timecop'

log_dir = File.expand_path('../../log', __FILE__)
FileUtils.mkdir_p(log_dir) unless File.exist?(log_dir)
logger = Logger.new(log_dir + '/test.log')

MongoMapper.connection = Mongo::MongoClient.new('127.0.0.1', 27017, logger: logger)
MongoMapper.database = 'test'
MongoMapper.database.collections.each { |c| c.drop_indexes }

require 'unread_mongomapper'

class User
  include MongoMapper::Document; safe
  include UnreadMongomapper

  acts_as_reader

  key :name, type: String
end

class Email
  include MongoMapper::Document; safe

  include UnreadMongomapper

  acts_as_readable

  key :subject, type: String
  key :content, type: String
  timestamps!

end
