$infinity = [float]::PositiveInfinity

# the graph
$graph = @{}
$graph["start"] = @{}
$graph["start"]["a"] = 6
$graph["start"]["b"] = 2

$graph["a"] = @{}
$graph["a"]["fin"] = 1

$graph["b"] = @{}
$graph["b"]["a"] = 3
$graph["b"]["fin"] = 5

$graph["fin"] = @{}

# the costs table
$costs = [ordered]@{}
$costs["a"] = 6
$costs["b"] = 2
$costs["fin"] = $infinity

# the parents table
$parents = [ordered]@{}
$parents["a"] = "start"
$parents["b"] = "start"
$parents["fin"] = $null

$processed = New-Object System.Collections.Generic.HashSet[String]

function Find-GRKLowestCostNode
{
    param ($costs)
    $lowest_cost = $infinity
    $lowest_cost_node = $null
    # Go through each node.
    foreach ($node in $costs.GetEnumerator())
    {
        $cost = $costs[$node.key]
        # If it's the lowest cost so far and hasn't been processed yet...
        if (($cost -lt $lowest_cost) -and ($node.key -notin $processed))
        {
            # ... set it as the new lowest-cost node.
            $lowest_cost = $cost
            $lowest_cost_node = $node
        }
    }
    return $lowest_cost_node
}

# Find the lowest-cost node that you haven't processed yet.
$node = Find-GRKLowestCostNode $costs
$i = 0
# If you've processed all the nodes, this while loop is done.
while ($node -ne $null)
{
    $i++
    $cost = $costs[$node.Key]
    $neighbors = $graph[$node.Key]
    foreach ($n in $neighbors.Keys)
    {
        $new_cost = $cost + $neighbors[$n]
        # If it's cheaper to get to this neighbor by going through this node...
        if ($costs[$n] -gt $new_cost)
        {
            # ... update the cost for this node.
            $costs[$n] = $new_cost
            # This node becomes the new parent for this neighbor.
            $parents[$n] = $node.Key
        }
    }
    # Mark the node as processed.
    $processed.Add($node.Key) >$null
    # Find the next node to process, and loop.
    $node = Find-GRKLowestCostNode $costs
}

Write-Host "Cost from the start to each node:"
Write-Host ($costs | Out-String)