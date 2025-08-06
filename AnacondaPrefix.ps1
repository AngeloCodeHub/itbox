$Env:CONDA_EXE = "C:/ProgramData/anaconda3\Scripts\conda.exe"
$Env:_CE_M = $null
$Env:_CE_CONDA = $null
$Env:_CONDA_ROOT = "C:/ProgramData/anaconda3"
$Env:_CONDA_EXE = "C:/ProgramData/anaconda3\Scripts\conda.exe"

$CondaModuleArgs = @{ChangePs1 = $True}
Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs

Remove-Variable CondaModuleArgs

conda activate 'C:\ProgramData\anaconda3'

# 使用pwsh7會有問題
# C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -NoExit -Command D:\WorkSpace\itbox\conda.ps1

