$voted = @{}
function Check-GRKVoter
{
    param($name)
    if ($voted.Contains($name))
    {
        Write-Host "kick them out!"
    }
    else
    {
        $voted[$name] = $True
        Write-Host "let them vote!"
    }
}

Check-GRKVoter tom
Check-GRKVoter mike
Check-GRKVoter mike