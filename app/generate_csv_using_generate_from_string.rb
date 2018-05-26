require 'pry'
require 'csv'
require_relative './connect_db'
require_relative '.././benchmark_helpers'

puts "=============== when using csv.generate for csv generation ======================"
headers = ['email', 'username', 'first_name', 'last_name']
print_memory_usage do
  print_time_spent do
    final_content = []
    final_content << CSV.generate_line(headers)
    User.find_each(batch_size: 100) do |user|
      final_content << CSV.generate_line([user.email, user.username, user.first_name, user.last_name])
    end
  end
end

