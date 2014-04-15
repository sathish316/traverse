module Traverse
  class Path
    attr_reader :path
    attr_reader :ignore_nil

    def initialize
      @path = []
      @ignore_nil = false
      @allow_nil_paths = []
    end

    def just
      if last_path
        @allow_nil_paths << last_path
      else
        # beginning of traversal
        @ignore_nil = true
      end
      self
    end

    def method_missing(method_name, *args, &block)
      @path << method_name
      self
    end

    def get(collection)
      Traverse::ArrayTraverser.new(self).get(collection)
    end

    def set(collection, value)
      Traverse::ArrayTraverser.new(self).set(collection, value)
    end

    def ignore_nil_for(key)
      @allow_nil_paths.include?(key)
    end

    private

    def last_path
      @path[-1]
    end
  end
end
