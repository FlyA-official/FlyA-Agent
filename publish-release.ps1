# FlyA Agent 发布脚本
# 用法: .\publish-release.ps1 -Version "0.8.0" [-DryRun]
#
# 前提:
#   1. 已用新账号登录 gh: gh auth login
#   2. 公开仓库已创建并初始化 (README + LICENSE)
#   3. 编译产物在 build/ 目录下

param(
    [Parameter(Mandatory=$true)]
    [string]$Version,

    [string]$PublicRepo = "",  # 格式: "账号/仓库名", 如 "FlyA-Release/FlyA-Agent"

    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

# === 配置 ===
$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
# 如果脚本不在预期位置，回退到相对路径
if (-not (Test-Path "$ProjectRoot\build")) {
    $ProjectRoot = Resolve-Path "$PSScriptRoot\..\.."
}

$SetupExe = "$ProjectRoot\build\FlyA-Agent-$Version-win-x64-setup.exe"
$PortableZip = "$ProjectRoot\build\FlyA-Agent-$Version-win-x64.zip"

# === 检查文件 ===
$Assets = @()
if (Test-Path $SetupExe) { $Assets += $SetupExe } else { Write-Warning "未找到: $SetupExe" }
if (Test-Path $PortableZip) { $Assets += $PortableZip } else { Write-Warning "未找到: $PortableZip" }

if ($Assets.Count -eq 0) {
    Write-Error "没有找到任何发布文件，请先编译"
    exit 1
}

Write-Host "`n=== FlyA Agent Release v$Version ===" -ForegroundColor Cyan
Write-Host "目标仓库: $PublicRepo"
Write-Host "发布文件:"
$Assets | ForEach-Object { Write-Host "  - $(Split-Path -Leaf $_)" -ForegroundColor Green }

if (-not $PublicRepo) {
    Write-Error "请指定 -PublicRepo 参数，格式: '账号/仓库名'"
    exit 1
}

# === Release Notes ===
$Notes = @"
## FlyA Agent v$Version

下载说明：
- **setup.exe** — Windows 安装包（推荐）
- **.zip** — Windows 便携版（免安装，解压即用）
"@

if ($DryRun) {
    Write-Host "`n[DryRun] 将执行:" -ForegroundColor Yellow
    Write-Host "gh release create v$Version --repo $PublicRepo --title `"FlyA Agent v$Version`" $($Assets -join ' ')"
    Write-Host "`nRelease Notes:`n$Notes"
    exit 0
}

# === 确认 ===
$confirm = Read-Host "`n确认发布到 $PublicRepo ? (y/n)"
if ($confirm -ne 'y') {
    Write-Host "已取消" -ForegroundColor Yellow
    exit 0
}

# === 创建 Release ===
$assetArgs = $Assets | ForEach-Object { "`"$_`"" }
$cmd = "gh release create `"v$Version`" --repo `"$PublicRepo`" --title `"FlyA Agent v$Version`" --notes `"$Notes`" $($assetArgs -join ' ')"
Write-Host "`n正在发布..." -ForegroundColor Cyan
Invoke-Expression $cmd

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n发布成功! https://github.com/$PublicRepo/releases/tag/v$Version" -ForegroundColor Green
} else {
    Write-Error "发布失败"
}
