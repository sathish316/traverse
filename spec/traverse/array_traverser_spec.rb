require 'spec_helper'

describe Traverse::ArrayTraverser do
  it "should get value from array of hashes" do
    books = [
      {isbn: 1, title: 'catch22', genre: 'warfiction'},
      {isbn: 2, title: 'hobbit', genre: 'fantasy'},
      {isbn: 3, title: 'I,Robot', genre: 'scifi'}
    ]
    t = traverse.just.genre
    t.get(books).should == ['warfiction', 'fantasy', 'scifi']
  end

  it "should set value in array of hashes" do
    books = [
      {isbn: 1, title: 'catch22', genre: 'warfiction'},
      {isbn: 2, title: 'hobbit', genre: 'fantasy'},
      {isbn: 3, title: 'I,Robot', genre: 'scifi'}
    ]
    t = traverse.just.genre
    t.set(books, 'fiction')
    books.map {|book| book[:genre]}.should == ['fiction', 'fiction', 'fiction']
  end
end
