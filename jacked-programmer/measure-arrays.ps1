$Array = @()
$ArrayList = [System.Collections.ArrayList]@()

Measure-Command -Expression {@(0..50000).ForEach({$Array+=$_})}
Measure-Command -Expression {@(0..50000).ForEach({$ArrayList.Add($_)})}

# Days              : 0
# Hours             : 0
# Minutes           : 2
# Seconds           : 10
# Milliseconds      : 784
# Ticks             : 1307842282
# TotalDays         : 0.00151370634490741
# TotalHours        : 0.0363289522777778
# TotalMinutes      : 2.17973713666667
# TotalSeconds      : 130.7842282
# TotalMilliseconds : 130784.2282

# Days              : 0
# Hours             : 0
# Minutes           : 0
# Seconds           : 0
# Milliseconds      : 526
# Ticks             : 5265591
# TotalDays         : 6.09443402777778E-06
# TotalHours        : 0.000146266416666667
# TotalMinutes      : 0.008775985
# TotalSeconds      : 0.5265591
# TotalMilliseconds : 526.5591
