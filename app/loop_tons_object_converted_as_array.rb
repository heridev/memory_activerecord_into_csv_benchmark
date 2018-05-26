require 'pry'
require 'csv'
require "ostruct"
require_relative './connect_db'
require_relative '.././benchmark_helpers'

puts "=============== Convert activerecord collection into an array and interate them using batches ======================"
print_memory_usage do
  print_time_spent do
    user_objects = User.select('id')
    counter = 0
    @new_collection = []
    user_objects.find_each(batch_size: 100) do |user|
      counter +=1
      @new_collection << { id: user.id, position: counter }
      #@new_collection << OpenStruct.new({id: user.id, position: counter})
    end
  end
end

