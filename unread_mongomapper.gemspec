# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unread_mongomapper/version"

Gem::Specification.new do |s|
  s.name        = "unread-mongomapper"
  s.version     = UnreadMongomapper::VERSION
  s.authors     = ["Mike Lawlor", "Hunter Haydel", "Georg Ledermann"]
  s.email       = ["mike@auka.ca"]
  s.homepage    = ""
  s.summary     = %q{Manages read/unread status of MongoMapper objects}
  s.description = %q{This gem creates a scope for unread objects and adds methods to mark objects as read }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'mongo_mapper'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'timecop'
end
