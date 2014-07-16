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
  include MongoMapper::Document
  include UnreadMongomapper

  acts_as_reader

  field :name, type: String
end

class Email
  include Mongoid::Document
  include Mongoid::Timestamps

  include UnreadMongomapper

  acts_as_readable

  field :subject, type: String
  field :content, type: String
end

puts "Testing with Mongoid #{Mongoid::VERSION}"
