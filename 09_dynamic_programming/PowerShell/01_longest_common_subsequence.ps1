$word_a = "fish"
$word_b = "vista"

# Init the empty two-dimensional array
$cell = @()
for ($i = 0; $i -lt $word_a.Length; $i++)
{
    $list = @()
    for ($j = 0; $j -lt $word_b.Length; $j++)
    {
        $list += , 0
    }
    $cell += , $list
}

for ($i = 0; $i -lt $word_a.Length; $i++)
{
    for ($j = 0; $j -lt $word_b.Length; $j++)
    {
        if ($word_a[$i] -eq $word_b[$j]) {
            # The letters match.
            $cell[$i][$j] = $cell[$i-1][$j-1] + 1
        }
        else
        {
            # The letters don't match.
            $cell[$i][$j] = 0
    }
    }
}

0..($cell.count-1) | ForEach-Object {Write-Host $cell[$_] -Separator `t}