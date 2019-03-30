$graph = @{}
$graph["you"] = @("alice", "bob", "claire")
$graph["bob"] = @("anuj", "peggy")
$graph["alice"] = @("peggy")
$graph["claire"] = @("thom", "jonny")
$graph["anuj"] = @()
$graph["peggy"] = @()
$graph["thom"] = @()
$graph["jonny"] = @()

function Test-GRKPersonIsSeller
{
    param($name)
    return $name[-1] -eq 'm'
}

function Search-GRKPerson
{
    param($name)
    $search_queue = New-Object System.Collections.Queue
    $graph[$name] | % {$search_queue.Enqueue($_)}
    # This array is how you keep track of which people you've searched before.
    $searched = New-Object System.Collections.Generic.List[System.Object]
    while ($search_queue.count -gt 0) {
        $person = $search_queue.Dequeue()
        # Only search this person if you haven't already searched them.
        if ($person -notin $searched)
        {
            if (Test-GRKPersonIsSeller($person))
            {
                Write-Host($person + " is a mango seller!")
                return $True
            }
            else
            {
                $graph[$person] | % {$search_queue.Enqueue($_)}
                # Marks this person as searched
                $searched.Add($person)
            }
         
        }
    }
    return $False
}

Search-GRKPerson you