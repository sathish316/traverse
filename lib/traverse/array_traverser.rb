module Traverse
  class ArrayTraverser
    def initialize(path)
      @path = path
    end

    def get(collection)
      result = []
      collection.each do |record|
        temp = nil
        @path.path.each do |key|
          temp = (record || temp)[key]
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
