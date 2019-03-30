function Get-GRKFact
{
    param ($x)
    if ($x -eq 1)
    {
        return 1
    }
    else
    {
        return $x * (Get-GRKFact ($x-1))
    }
}

Get-GRKFact 5