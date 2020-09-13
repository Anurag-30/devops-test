As mentioned your application receives an average of 26.6 new connection per second, each lasting 0.05 sec and the total processed bytes for requests and responses is 15000 KB per minute. We calculate your monthly Application Load Balancer costs using pricing in the Frankfurt Region as follows:

New connections (per second): Each LCU provides `25` new connections per second (averaged over the hour). Since your application receives `26.6` new connection per second, this translates to `1.064` LCUs (`26.6 connection per second / 25 connections per second`)

Active connections (per minute): Each LCU provides 3,000 active connections per minute. Your application receives `27` new connection per second, each lasting `0.05 sec`. This translates to `1.344` active connections per minute, or `0.0004` LCUs (1.344 active connections per minute / 3,000 active connections per minute)

Processed Bytes (GBs per hour): Each LCU provides 1 GB of processed bytes per hour. Since each client connection transfers `250 KB` of data per second(15000Kb/60), it translates to `0.9 GB per hour` or `0.9` LCUs (1.08 GB/1 GB).


Using these values, the hourly bill is calculated by taking the maximum LCUs consumed across the three dimensions. In this example, the new connectionsdimension (`1.064 LCUs`) is greater than processed bytes  (`0.9 LCU's`), active connections (`0.004 LCUs`) resulting in a total charge of `$0.0085 per hour` (1.064 LCUs * $0.008 per LCU) or `$6.12 per month ($0.0085 * 24 hours * 30 days)`.

Adding the hourly charge of $0.027, the total Application Load Balancer costs are:

$0.0355 per hour ($0.027 hourly charge + $0.0085 LCU charge); or
$25.56 per month ($0.0355 * 24 hours * 30 days).