function Get-GRKCount
{
    param($list)
    if ($list -eq $null)
    {
        return 0
    }
    return 1 + (Get-GRKCount ($list | Select-Object -Skip 1))
}

Get-GRKCount ("one", "two", "three", "four")