# db_metrics.rb will parse iostat and pull the load, the CPU stats and the disk load averaged
# over one second. It's intended to be used to inject these values into a log stream

# It depends on a sane io_stat output like this

#       disk0           disk2           disk5       cpu     load average
# KB/t tps  MB/s     KB/t tps  MB/s     KB/t tps  MB/s  us sy id   1m   5m   15m
#16.58  22  0.36   212.46   0  0.00    10.20   0  0.00  10  6 84  0.87 0.95 1.09
#16.00   1  0.02     0.00   0  0.00     0.00   0  0.00   8  6 86  1.12 1.00 1.10


report = Array.new
x = 0
iostat = `iostat -c2`

headers_iostat = iostat.split(/\r?\n/)[0]
details_iostat = iostat.split(/\r?\n/)[1]
metrics_iostat = iostat.split(/\r?\n/)[3]

array_of_headers = headers_iostat.split
array_of_metrics = metrics_iostat.split
array_of_details = details_iostat.split

array_of_headers.each { |a| 
  unless a == "average"
    report << a + ", " + 
              array_of_details[x] + ": " + array_of_metrics[x] + ", " + 
              array_of_details[x+1] + ": " + array_of_metrics[x+1] + ", " + 
              array_of_details[x+2] + ": " + array_of_metrics[x+2]
  
    x = x + 3
  end
  }
  
report.reverse.each {|r| puts r }