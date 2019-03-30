# Finds the smallest value in an array
function Find-GRKSmallest
{
    param ($arr)
    # Stores the smallest value
    $smallest = $arr[0]
    # Stores the index of the smallest value
    $smallest_index = 0
    0 .. ($arr.count - 1) | ForEach-Object {
        if ($arr[$_] -lt $smallest) {
            $smallest_index = $_
            $smallest = $arr[$_]
        }
    }
    return $smallest_index
}

# Sort array
function Sort-GRKSelection
{
    param ($arr)
    $newArr = New-Object System.Collections.Generic.List[System.Object]
    1 .. $arr.count | ForEach-Object {
        # Finds the smallest element in the array and adds it to the new array
        $smallest = Find-GRKSmallest $arr
        $newArr.Add($arr[$smallest])
        $arr.RemoveAt($smallest)
    }
    return $NewArr
}

# Can't use a default "@()" range notation as it creates static arrays
$arr = New-Object System.Collections.Generic.List[System.Object]
$arr.AddRange((5, 3, 6, 2, 10))
Sort-GRKSelection $arr