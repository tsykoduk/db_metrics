uptime = `uptime`

# output should look like this
# => " 19:31:19 up 7 days, 40 min,  0 users,  load average: 11.55, 12.50, 14.99\n"

load_stat = "Load Average: " + uptime.split(':')[3].chomp.lstrip

# => "1.40 1.23 1.43"

vmstat = `vmstat`

#I think we are going to want to in include vmstat -d or iostat here as well.

# output should look like this
# => "procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----\n 
#    r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa\n 
#    2  0 232684 479652 21943084 17665440  111   77   123   826    6    0 27  7 63  3\n"

headers_vmstat = vmstat.split(/\r?\n/)[1]
metrics_vmstat = vmstat.split(/\r?\n/)[2]


#inject into log stream somehow here.

puts load_stat
puts headers_vmstat
puts metrics_vmstat