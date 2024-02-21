Import-Module posh-git
Import-Module PSFzF
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

function config {
    nvim C:\Users\adam.miller\.config\powershell\user_profile.ps1
}

function bd {
    dotnet build -c Debug .\Source
}

function br {
    dotnet build -c Release .\Source
}

function rr {
    dotnet restore .\Source
}

function jedi {
    cd /git/JEDIv2
}

function rmb {
    [CmdletBinding()]
    param(
         [Parameter(Mandatory = $true)]
         [string]
         $BranchName
     )
    git push --delete origin $BranchName
    git branch -D $BranchName
}

function Run-Test {
    [CmdletBinding()]
    param(
         [Parameter(Mandatory = $true)]
         [string]
         $ProjectPath
     )
    dotnet test --logger "html;LogFileName=results.html" $ProjectPath
}

function Dependency-Graph {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $StartingPath
    )
    python /git/project_dependency.py $StartingPath
}

function storage {
    param (
        $dbImage = "mcr.microsoft.com/mssql/server:2019-latest",
        $name = "jediv2-db",
        $dataVolume = "db-data",
        $logVolume = "db-log"
    )
    docker run -u 0:0 --name $name -v "${dataVolume}:/var/opt/mssql/data" -v "${logVolume}:/var/opt/mssql/log" -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=dev#Password" -p 1433:1433 -d $dbImage
    docker run --name jediv2-redis -v redis_data:/data -p 6379:6379 -d redis
}

function storage-stop {
    docker rm --force -v jediv2-db
    docker rm --force -v jediv2-redis
}

function db {
    dotnet run --project 'c:\git\JEDIv2\Source\DevTools\DatabaseGenerator\DatabaseGenerator.csproj' -- generate --root-dir c:\git\JEDIv2 --database=all --recreate-db --command-timeout=120
}

function Load-Data {
    param(
        $suite = $null
    )
    $exe = 'dotnet run -c Release --no-build --project Source\DevTools\TestDataLoader\TestDataLoader.csproj'

    if($suite)
    {
        Invoke-Expression "$exe load $suite"
        return
    }

    $action = Invoke-Expression "$exe list" | fzf
    if(-Not ($action)) {
        return
    }

    Invoke-Expression "$exe load $action"
}

function Import-Job {
    param(
        $JobNumber,
        $Site
    )
    dotnet run --project 'c:\git\JEDIv2\Source\DevTools\TestDataFromSql\TestDataFromSql.csproj' -- load-material-references --env-file 'c:\git\JEDIv2\.env' --site $Site --output-format sql --output-type database
    dotnet run --project 'c:\git\JEDIv2\Source\DevTools\TestDataFromSql\TestDataFromSql.csproj' -- load-v1-references --env-file 'c:\git\JEDIv2\.env' --site $Site --output-format sql --output-type database
    dotnet run --project 'c:\git\JEDIv2\Source\DevTools\TestDataFromSql\TestDataFromSql.csproj' -- load-v1-job --env-file 'c:\git\JEDIv2\.env' --job $JobNumber --site $Site --output-format sql --output-type database
    dotnet run --project 'c:\git\JEDIv2\Source\DevTools\TestDataLoader\TestDataLoader.csproj' -- load UserData-AddMeAsEngineer
}

function Test-Sln {
    param(
        [switch] $All
    )
    if($All) {
        dotnet test .\Source\ -c Release --nologo | select-string -Pattern "(Passed|Failed)!"
    } else {
        dotnet test .\Source\ -c Release --nologo --filter='(TestCategory!~HasPopUp) & (TestCategory!~AnalysisValidation) & (TestCategory!~DeploymentOnly) & (TestCategory!~LongRunning)' | select-string -Pattern "(Passed|Failed)!"
    }
}

function Clean-Sln {
    gci -inc bin,obj -rec | rm -rec -force
}

function Fix-Colors {
    [Console]::ResetColor()
}
