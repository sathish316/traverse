require "traverse/version"
require 'traverse/path'
require 'traverse/hash_traverser'
require 'traverse/array_traverser'

module Traverse
  # Your code goes here...
end

module Kernel
  def traverse
    Traverse::Path.new
  end
end
