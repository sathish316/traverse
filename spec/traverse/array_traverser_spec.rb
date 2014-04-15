require 'spec_helper'

describe Traverse::ArrayTraverser do
  it "should get value from array of hashes" do
    books = [
      {isbn: 1, title: 'catch22', genre: 'warfiction'},
      {isbn: 2, title: 'hobbit', genre: 'fantasy'},
      {isbn: 3, title: 'I,Robot', genre: 'scifi'}
    ]
    t = traverse.genre
    t.get(books).should == ['warfiction', 'fantasy', 'scifi']
  end

  it "should ignore nil values if just" do
    books = [
      {isbn: 1, title: 'catch22', genre: 'warfiction'},
      nil,
      {isbn: 3, title: 'I,Robot', genre: 'scifi'}
    ]
    t = traverse.just.genre
    t.get(books).should == ['warfiction', nil, 'scifi']
  end

  it "should set value in array of hashes" do
    books = [
      {isbn: 1, title: 'catch22', genre: 'warfiction'},
      {isbn: 2, title: 'hobbit', genre: 'fantasy'},
      {isbn: 3, title: 'I,Robot', genre: 'scifi'}
    ]
    t = traverse.genre
    t.set(books, 'fiction')
    books.map {|book| book[:genre]}.should == ['fiction', 'fiction', 'fiction']
  end

  it "should get nested value from array of hashes" do
    people = [
      {firstname: 'F1', lastname: 'L1', address: {street: 'S1', city: 'New York'}},
      {firstname: 'F2', lastname: 'L2', address: {street: 'S2', city: 'Chicago'}},
      {firstname: 'F3', lastname: 'L3', address: {street: 'S3', city: 'New York'}}
    ]
    t = traverse.address.city
    t.get(people).should == ['New York', 'Chicago', 'New York']
  end

  it "should get nested value ignoring nils if just for path" do
    people = [
      {firstname: 'F1', lastname: 'L1', address: {street: 'S1', city: 'New York'}},
      {firstname: 'F2', lastname: 'L2', address: {street: 'S2', city: 'Chicago'}},
      {firstname: 'F3', lastname: 'L3'}
    ]
    t = traverse.address.just.city
    t.get(people).should == ['New York', 'Chicago', nil]
  end
end
