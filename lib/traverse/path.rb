module Traverse
  class Path
    attr_reader :path
    attr_reader :ignore_nulls

    def just
      self.ignore_nulls = true
      self
    end

    def method_missing(method_name, *args, &block)
      @path ||= []
      @path << method_name
      self
    end

    def get(collection)
      Traverse::ArrayTraverser.new(self).get(collection)
    end

    def set(collection, value)
      Traverse::ArrayTraverser.new(self).set(collection, value)
    end
  end
end
