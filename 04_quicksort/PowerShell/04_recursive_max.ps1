function Get-GRKMax
{
    param($lst)
    if ($lst.count -eq 0)
    {
        return $null
    }
    if ($lst.count -eq 1)
    {
        return $lst[0]
    }
    else
    {
        $sub_max = Get-GRKMax ($lst | Select-Object -Skip 1)
        if ($lst[0] -gt $sub_max)
        {
            return $lst[0]
        }
        else
        {
            return $sub_max
        }
    }
}


Get-GRKMax (33, 7, 6, 100, 15, 13)