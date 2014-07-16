module UnreadMongomapper
  def self.included(base)
    base.extend Base
  end

  module Base
    def acts_as_reader
      many :read_marks, as: :reader, dependent: :destroy

      include Reader
    end

    def acts_as_readable
      many :read_marks, as: :readable, dependent: :destroy

      before_save do |readable|
        readable.mark_as_unread!
      end

      include Readable::InstanceMethods
      extend Readable::ClassMethods
      extend Readable::Scopes
    end
  end
end
