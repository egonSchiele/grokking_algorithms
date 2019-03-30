function Get-GRKSum
{
    param($list)
    if ($list -eq $null)
    {
        return 0
    }
    return $list[0] + (Get-GRKSum ($list | Select-Object -Skip 1))

}

Get-GRKSum (1, 2, 3, 4)