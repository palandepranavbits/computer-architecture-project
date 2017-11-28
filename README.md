# computer-architecture-project
Cache - Way Halting 
--Specification
Cache Size = 1KB
Cache Line Size = 16B
4 way Set Associative, Write Back Policy
Random Replacement

Offset -- 3 bits
Index -- 4 bits
Tag -- 25 bits

Total cache size:
16*1 = 2B(for dirty bits) 
16*1 = 2B(for valid bits)
16*25 = 50B(for tag bits-- 4bits for halt tag nd 21 bits for main tag array)
total = (50+2+2)*4 = 216B
Total for Cache = 1024 + 216 = 1240B

The following are number of hits and misses as per the designed test bench (might change depending on the random number generated)
each cache access takes 4 clock cycles
--No. of Cache Hits   =    21
--No. of Cache Misses =    12
