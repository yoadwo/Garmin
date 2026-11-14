$ErrorActionPreference = 'Stop'

$envFile = Join-Path $PSScriptRoot 'connectiq.local.env'
if (-not (Test-Path $envFile)) {
    throw "Connect IQ environment file not found: $envFile"
}

foreach ($line in Get-Content $envFile) {
    $trimmedLine = $line.Trim()
    if ($trimmedLine.Length -eq 0 -or $trimmedLine.StartsWith('#')) {
        continue
    }

    if ($trimmedLine -notmatch '^([^=]+)=(.*)$') {
        throw "Invalid environment variable entry in $envFile`: $trimmedLine"
    }

    $name = $Matches[1].Trim()
    $value = $Matches[2].Trim()
    [Environment]::SetEnvironmentVariable($name, $value, 'Process')
}

if ([string]::IsNullOrWhiteSpace($env:CONNECTIQ_SDK_HOME)) {
    throw "CONNECTIQ_SDK_HOME is not set in $envFile"
}

$jar = Join-Path $env:CONNECTIQ_SDK_HOME 'bin\monkeybrains.jar'
if (-not (Test-Path $jar)) {
    throw "Connect IQ compiler JAR not found: $jar"
}

$projectRoot = Split-Path $PSScriptRoot -Parent
Push-Location $projectRoot
try {
    $buildCommand = 'java -Xms1g -Dfile.encoding=UTF-8 -Dapple.awt.UIElement=true -jar "' + $jar + '" -o "bin\suuntuv1.prg" -f "monkey.jungle" -y "developer_key" -d "fenix9pro51mm_sim" -w'
    & $env:ComSpec /c $buildCommand
    $buildExitCode = $LASTEXITCODE
}
finally {
    Pop-Location
}

exit $buildExitCode
