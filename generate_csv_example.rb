require 'csv'
require_relative './benchmark_helpers'

headers = ['email', 'username', 'first_name', 'last_name']

email   = 'p@elh.mx'
username = 'elh'
first_name = 'heriberto'
last_name = 'magaña'

print_memory_usage do
  print_time_spent do
    CSV.open('data.csv', 'w', write_headers: true, headers: headers) do |csv|
      1_000_000.times do |i|
        csv << [email, username, first_name, last_name]
      end
    end
  end
end
