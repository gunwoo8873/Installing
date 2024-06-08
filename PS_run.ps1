function ReleaseNote() {
# Write-Output = Output
Write-Output "
============================================================================
Powershell Script 기반으로 제작한 선택형 명령어 수행 프로세스 입니다.
주의 : 현재 Git과 Docker 명령어 간편화는 테스트중이므로 오류가 발생할 수 있습니다.
Shell과 Powershell의 튜토리얼 내용과 스크립트는 아래 저장소에 있습니다.
============================================================================
This is a selection-based command execution process created with Powershell Script.
Note: The simplification of Git and Docker commands is currently being tested, so errors may occur.
The tutorial content and scripts for Shell and Powershell are available in the following repositories.
============================================================================
Tutorial : https://github.com/gunwoo8873/Tutorial.git
Claude Project : https://github.com/gunwoo8873/Claude-Project.git
============================================================================"
}

# Main Commands script path
$GIT_SCRIPT_PATH = "./Commands/git_command.ps1"
$DOCKER_SCIRPT_PATH = "./Commands/docker_command.ps1"

# TODO(@gunwoo8873) : PowerShell Scripting and Main Command Menu
class DebugCommand {
    
}

function Command_Run() {
    # Set-PSDebug : 
    Set-PSDebug -Trace 1
    git_command {
        # [Main Command] [Option] [Target] [Option] [Option]
        if (Test-Path -Path $GIT_SCRIPT_PATH -PathType Leaf ) {
            Write-Output ""
        }
        elseif () {

        }
    }
    docker_command {
        if (Test-Path -Path $DOCKER_SCIRPT_PATH -PathType Leaf ) {

        }
        elseif () {

        }
    }
}