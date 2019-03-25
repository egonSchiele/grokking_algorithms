function Search-GRKBinary
{
    param ($list, $item)

    # $low and $high keep track of which part of the list you'll search in.
    $low = 0;
    $high = $list.Length - 1;

    # While you haven't narrowed it down to one element ...
    while ($low -le $high)
	{
        # ... check the middle element
        $mid = [int](($low + $high) / 2);
        $guess = $list[$mid];
        # Found the item.
        if ($guess -eq $item)
        {
            return $mid;
        }
        # The guess was too high.
        if ($guess -gt $item)
        {
            $high = $mid - 1
        }
        # The guess was too low
        else
        {
            $low = $mid + 1
        }
              
    }

    # Item doesn't exist
    return $null;
}

$mylist = (1, 3, 5, 7, 9);
Search-GRKBinary $mylist 3 # => 1
Search-GRKBinary $mylist -1 # => $null