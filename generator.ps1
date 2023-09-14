# Define the path
$csvFilePath = ".\UtilizationData.csv"

$cpuUsage = Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 1 -MaxSamples 1 | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
$ramUsage = Get-Counter -Counter "\Memory\% Committed Bytes In Use" -SampleInterval 1 -MaxSamples 1 | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$data = [PSCustomObject]@{
    Timestamp = $timestamp
    CPUUsage = $cpuUsage
    RAMUsage = $ramUsage
}

# Save data in CSV

$data | Export-Csv -Path $csvFilePath -Append -NoTypeInformation