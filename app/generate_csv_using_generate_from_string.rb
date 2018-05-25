require 'pry'
require 'csv'
require_relative './connect_db'
require_relative '.././benchmark_helpers'

puts "=============== when using csv.generate for csv generation ======================"
headers = ['email', 'username', 'first_name', 'last_name']
print_memory_usage do
  print_time_spent do
    CSV.generate(write_headers: true, headers: headers) do |csv|
      User.find_each(batch_size: 100) do |user|
        csv << [user.email, user.username, user.first_name, user.last_name]
      end
    end
  end
end

