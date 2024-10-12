Set-StrictMode -Version Latest
Clear-Host


$filepath = 'doesnotexist'

$ErrorActionPreference = 'Stop' # ----------------+
try {                           #                 |
                                #                 V
    $files = Get-ChildItem -Path $filepath # -ErrorAction Stop

    Write-Output 'should still see this even if error'

    $files.foreach({
        $content = get-content -Path $_.fullname
        $content
    })
    "AFTER foreach"
} catch {
    $what = $_
    $what.GetType()
    ($what | Get-Member).foreach({
        $_.name
    })
    ""
    ""
    $exception = $what.Exception
    $exception.GetType()
    ($exception | Get-Member).foreach({
        $_.name
    })
} finally {
    "`nFINALLY"
}