function Get-GRKQuickSort
{
    param($array)
    if ($array.count -lt 2)
    {
        # base case, arrays with 0 or 1 element are already "sorted"
        if ($null -ne $array)
        {
            return , $array
        }
        else 
        {
            return $null
        }
    }
    else
    {
        # recursive case
        $pivot = $array[0]
        # sub-array of all the elements less than the pivot
        $less = @($array | Select-Object -Skip 1 | Where-Object {$_ -le $pivot})
        # sub-array of all the elements greater than the pivot
        $greater = @($array | Select-Object -Skip 1 | Where-Object {$_ -gt $pivot})
        return @((Get-GRKQuickSort $less) + , $pivot + (Get-GRKQuickSort $greater))
    }
}

Get-GRKQuickSort (5, 3, 6, 2, 10)