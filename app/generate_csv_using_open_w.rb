require 'pry'
require 'csv'
require_relative './connect_db'
require_relative '.././benchmark_helpers'

puts "=============== when using csv.open for csv generation ======================"
headers = ['email', 'username', 'first_name', 'last_name']
print_memory_usage do
  print_time_spent do
    # creating a csv file with 70,000 aprox takes less than 10 MB of memory
    # https://cl.ly/2q301B1r092L
    CSV.open('users.csv', 'w', write_headers: true, headers: headers) do |csv|
      User.find_each(batch_size: 100) do |user|
        csv << [user.email, user.username, user.first_name, user.last_name]
      end
    end
  end
end

