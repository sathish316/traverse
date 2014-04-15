module Traverse
  class ArrayTraverser
    def initialize(path)
      @path = path
    end

    def get(collection)
      result = []
      collection.each do |record|
        temp = record
        unless @path.ignore_nil && record.nil?
          @path.path.each do |key|
            unless @path.ignore_nil_for(key) && temp[key].nil?
              temp = temp[key]
            end
          end
        end
        result << temp
      end
      result
    end

    def set(collection, value)
      last = @path.path[-1]
      collection.each do |record|
        temp = record
        temp[last] = value
      end
    end
  end
end
