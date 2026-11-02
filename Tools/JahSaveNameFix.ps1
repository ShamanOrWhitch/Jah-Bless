# После выхода из Fallout 4 срезает хвост, который Bethesda дописывает к сейвам.
# Было:  Exitsave0_00000000SM4A4168436F7265_Commonwealth_....fos
# Стало: Exitsave0.fos
# Пока игра запущена, файлы не трогает. Короткое имя слота и старые сейвы без "SM" не меняет.

$ErrorActionPreference = "Stop"

function Get-SavesFolder {
    $docs = [Environment]::GetFolderPath("MyDocuments")
    $path = Join-Path $docs "My Games\Fallout4\Saves"
    if (Test-Path -LiteralPath $path) { return $path }
    return $null
}

function Test-GameRunning {
    return $null -ne (Get-Process -Name "Fallout4" -ErrorAction SilentlyContinue)
}

function Repair-Saves([string]$Folder) {
    $rx = '^(?<slot>(?:Quick|Exit|Auto)?save\d*)_[0-9A-Fa-f]{8}SM.+\.(?<ext>fos|f4se)$'
    $files = Get-ChildItem -LiteralPath $Folder -File | Where-Object { $_.Name -match $rx }
    foreach ($file in $files) {
        if ($file.Name -notmatch $rx) { continue }
        $destName = "$($Matches.slot).$($Matches.ext)"
        $dest = Join-Path $Folder $destName
        if ($file.FullName -eq $dest) { continue }
        if (Test-Path -LiteralPath $dest) {
            $old = Get-Item -LiteralPath $dest
            if ($old.LastWriteTime -gt $file.LastWriteTime) {
                $kept = Join-Path $Folder ("{0}_kept.{1}" -f $Matches.slot, $Matches.ext)
                Move-Item -LiteralPath $file.FullName -Destination $kept -Force
                Write-Host ("оставил свежий {0}, хвост убран в {1}" -f $old.Name, (Split-Path $kept -Leaf))
                continue
            }
            Remove-Item -LiteralPath $dest -Force
        }
        Move-Item -LiteralPath $file.FullName -Destination $dest
        Write-Host ("{0}  ->  {1}" -f $file.Name, $destName)
    }
}

$folder = Get-SavesFolder
if (-not $folder) {
    Write-Host "Папка сохранений не найдена: Документы\My Games\Fallout4\Saves"
    exit 1
}

Write-Host "Папка: $folder"
Write-Host "Слежу. Хвост SM срезается, когда Fallout4 закрыт. Окно не закрывать, стоп — Ctrl+C."

while ($true) {
    if (-not (Test-GameRunning)) {
        Repair-Saves $folder
    }
    Start-Sleep -Seconds 2
}
