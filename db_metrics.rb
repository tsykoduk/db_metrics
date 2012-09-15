uptime = `uptime`

load_stat = "Load Average: " + uptime.split(':')[3].chomp.lstrip

# => "1.40 1.23 1.43"

#vmstat = `vmstat`
#headers_vmstat = vmstat.split(/\r?\n/)[1]
#metrics_vmstat = vmstat.split(/\r?\n/)[2]

iostat = `iostat -c2`

headers_iostat = iostat.split(/\r?\n/)[0]
details_iostat = iostat.split(/\r?\n/)[1]
metrics_iostat = iostat.split(/\r?\n/)[3]

#output

#~/Code/db_metrics ☯  iostat -c 2 
#          disk0           disk2           disk5       cpu     load average
#    KB/t tps  MB/s     KB/t tps  MB/s     KB/t tps  MB/s  us sy id   1m   5m   15m
#   16.77  22  0.36   221.35   0  0.00    11.33   0  0.00  10  6 83  5.92 5.58 5.83
#   28.00   5  0.14     0.00   0  0.00     0.00   0  0.00  26 12 62  5.92 5.58 5.83

#TODO put each disk on it's own line

#inject into log stream somehow here.

puts load_stat
#puts headers_vmstat
#puts metrics_vmstat
puts headers_iostat
puts details_iostat
puts metrics_iostat