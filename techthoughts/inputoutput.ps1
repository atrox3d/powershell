Set-StrictMode -Version Latest
Clear-Host

$URL = 'https://reddit.com/r/powershell.json'
$URL = 'http://192.168.1.10:8000/reddit'

# saved from chrome: no account
$LOCAL = "$PSScriptRoot\reddit.json"
$LINE = "#" * 80

try {
    $webResults = $null
    $webResults = Invoke-WebRequest -Uri $URL
    "INFO   | SUCCESS retrieving json from $URL"
    $LINE    
    $webResults
    $LINE
    # $webResults | Get-Member -MemberType Property | Select-Object name,typename
    # "#" * 80

    $rawJSON = $webResults.Content
} catch {
    $theError = $_
    Write-Warning "FATAL   | FAILED to retrieve json from $URL"
    $theError.exception.message
    $theError | fl * -Force
    Write-Warning "WARNING | loading from $LOCAL as string..."
    $rawJSON = Get-Content -Path $LOCAL
    # exit
}

$objData = $rawJSON | ConvertFrom-Json
$posts = $objData.data.children.data

# $posts.foreach({"$($_.title), $($_.score)"})
# $selectedPosts = $posts | Select-Object title,score | Sort-Object score -Descending | fl
# $selectedPosts

$LINE
$maxPosts = 5
"First $maxPosts posts"
$LINE
$posts | Select-Object title,url | Select-Object -First $maxPosts

""
$LINE
"find `"title`" inside $LOCAL"

$LINE
Get-Content $LOCAL | Select-String -pattern '"title"' | Select-Object -ExpandProperty line

$LINE
$ipRegex = "(\d{1,3}\.){3}\d{1,3}"
"filter ips.txt bt regex $ipRegex"
$LINE
Get-Content $PSScriptRoot\ips.txt | Select-String -Pattern $ipRegex -AllMatches | Select-Object -ExpandProperty line

$LINE
"select first 10 lines"
$LINE
$rawJSON = Get-Content $LOCAL
$rawJSON[0..10].ForEach({
    $_
})

$LINE
"select first 100 chars and replace `" with <quote>"
$LINE
$rawJSON = Get-Content $LOCAL -Raw
-join $rawJSON[0..100].ForEach({
    if($_ -eq '"'){
        "<quote>"
    } else {
        $_
    }
})


$LINE
"convert csv to array"
$LINE
$csv = Get-Content "$PSScriptRoot\reddit.csv" | convertfrom-csv
$csv | fl
$csv.getType()
$csv | Get-Member
$LINE
$csv[0] | Get-Member
$csv[0].GetType()




