require_relative './connect_db'
require 'active_record'
require 'activerecord-import'
require 'activerecord-import/active_record/adapters/postgresql_adapter'
require 'pry'

puts "==== Creating records ====="
3.times do
  users = []
  100_000.times do |i|
    users << User.new(email: "heriberto.perez+#{i}@magmalabs.io", username: "heridev_#{i}", first_name: 'heriberto', last_name: "magaña#{i}#{i}#{i}")
  end
  print '.'
  User.import users# or use import!
end

