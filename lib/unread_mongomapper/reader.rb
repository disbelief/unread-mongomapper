module UnreadMongomapper
  module Reader
    def self.assert_reader(obj)
      unless obj.kind_of?(UnreadMongomapper::Reader)
        raise ArgumentError, "Class #{obj.class.name} is not registered by acts_as_reader!"
      end
    end
  end
end
