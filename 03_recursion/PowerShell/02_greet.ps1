function Write-GRKGreet2
{
    param ($name)
    Write-Host("how are you, " + $name + "?")
}

function Write-GRKBye
{
    Write-Host "ok bye!"
}

function Write-GRKGreet
{
    param($name)
    Write-Host("hello, " + $name + "!")
    Write-GRKGreet2 $name
    Write-Host "getting ready to say bye..."
    Write-GRKBye
}

Write-GRKGreet adit