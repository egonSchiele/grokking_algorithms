function Get-GRKSum
{
    param($arr)
    $total = 0
    foreach ($x in $arr)
    {
        $total += $x
    }
    return $total
}

Get-GRKSum (1, 2, 3, 4)