function Write-GRKCountdown
{
    param ($i)
    # base case
    if ($i -le 0)
    {
        return 0
    }
    # recursive case
    else
    {
        write-Host($i)
        return Write-GRKCountdown($i-1)
    }
}

Write-GRKCountdown 5