module UnreadMongomapper
  module Readable
    module ClassMethods
      def mark_as_read!(target, options)
        reader = options[:for]
        UnreadMongomapper::Reader.assert_reader(reader)

        readables_to_mark = if(target == :all)
                              self.unread_by(reader)
                            else
                              target
                            end

        self.unread_by(reader).each do |readable|
          raise ArgumentError unless readable.is_a? self

          readable.mark_as_read! :for => reader
        end
      end
    end

    module InstanceMethods
      def unread?(reader)
        UnreadMongomapper::Reader.assert_reader(reader)

        ReadMark.where(reader_id: reader.id, reader_type: reader.class.to_s, readable_id: self.id, readable_type: self.class.to_s).empty?
      end

      def mark_as_read!(options)
        reader = options[:for]
        UnreadMongomapper::Reader.assert_reader(reader)

        ReadMark.create(reader_id: reader.id, reader_type: reader.class.to_s, readable_id: self.id, readable_type: self.class.to_s)
      end

      def mark_as_unread!
        self.read_marks.destroy_all
      end
    end
  end
end
