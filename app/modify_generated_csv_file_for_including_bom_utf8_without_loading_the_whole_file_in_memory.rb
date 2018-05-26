require 'pry'
require 'csv'
require_relative './connect_db'
require_relative '.././benchmark_helpers'

puts "=============== When you want to read a file that is really large or a big string you can do it this way using a file as a helper ======================"
print_memory_usage do
  print_time_spent do
    # this example is ready for example if you want to upload this to amazon you
    # can directly uploading using the gem aws
    # this will consume less than 10 MB and will include aprox 70,000 csv rows
    File.open("big_foreach_without_consuming_too_much_memory.csv", 'w') do |fo|
      fo.puts "\uFEFF"
      File.foreach('users.csv') do |li|
        fo.puts li
      end
    end
  end
end
