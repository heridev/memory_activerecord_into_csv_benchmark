require 'pry'
require 'csv'
require_relative './connect_db'
require_relative '.././benchmark_helpers'

puts "=============== when using csv.generate and also not reading the collection in batches is even worse======================"
headers = ['email', 'username', 'first_name', 'last_name']
print_memory_usage do
  print_time_spent do
    CSV.generate(write_headers: true, headers: headers) do |csv|
      User.all.each do |user|
        csv << [user.email, user.username, user.first_name, user.last_name]
      end
    end
  end
end
