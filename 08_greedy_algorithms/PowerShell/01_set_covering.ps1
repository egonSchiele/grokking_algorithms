# You pass an array in, and it gets converted to a set.
$states_needed = New-Object System.Collections.Generic.HashSet[string] -ArgumentList `
    (, [string[]]("mt", "wa", "or", "id", "nv", "ut", "ca", "az"))

$stations = [ordered]@{}
$stations["kone"] = New-Object System.Collections.Generic.HashSet[string] -ArgumentList `
    (, [string[]]("id", "nv", "ut"))
$stations["ktwo"] = New-Object System.Collections.Generic.HashSet[string] -ArgumentList `
    (, [string[]]("wa", "id", "mt"))
$stations["kthree"] = New-Object System.Collections.Generic.HashSet[string] -ArgumentList `
    (, [string[]]("or", "nv", "ca"))
$stations["kfour"] = New-Object System.Collections.Generic.HashSet[string] -ArgumentList `
    (, [string[]]("nv", "ut"))
$stations["kfive"] = New-Object System.Collections.Generic.HashSet[string] -ArgumentList `
    (, [string[]]("ca", "az"))

$final_stations = New-Object System.Collections.Generic.HashSet[string]

while ($states_needed.Count -gt 0)
{
    $best_station = $null
    $states_covered = New-Object System.Collections.Generic.HashSet[string]
    foreach ($station in $stations.GetEnumerator()) {
        $covered = New-Object System.Collections.Generic.HashSet[string]
        # The .IntersectWith method deletes entries from the object so we need a temporary
		# copy, should work in .NET 4.6+
        $states_needed_inter = New-Object System.Collections.Generic.HashSet[string] $states_needed, $states_needed.Comparer
        $states_needed_inter.IntersectWith($station.value)
        $states_needed_inter | % {$covered.Add($_) >$null} 
        if ($covered.count -gt $states_covered.count)
        {
            $best_station = $station.Key
			# See the previous comment
            $states_covered = New-Object System.Collections.Generic.HashSet[string] $covered, $covered.Comparer
        }
    }

    $states_covered | % {$states_needed.Remove($_) >$null}
    $final_stations.Add($best_station) >$null
}

Write-Host $final_stations