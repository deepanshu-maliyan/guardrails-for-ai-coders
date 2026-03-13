# =============================================================
# Guardrails for AI Coders - Windows PowerShell Installer
# https://github.com/deepanshu-maliyan/guardrails-for-ai-coders
# Usage: iwr https://raw.githubusercontent.com/deepanshu-maliyan/guardrails-for-ai-coders/main/install.ps1 | iex
# =============================================================

$REPO_URL = "https://github.com/deepanshu-maliyan/guardrails-for-ai-coders.git"
$INSTALL_DIR = ".ai-guardrails"

Write-Host ""
Write-Host "  ___                     _           _ _       " -ForegroundColor Blue
Write-Host " / __|_  _ __ _ _ _ __| |_ _ __ (_) |___  " -ForegroundColor Blue
Write-Host " \__ \ || / _' | '_/ _' | '_/ _' | | (_-< " -ForegroundColor Blue
Write-Host " |___/\_,_\__,_|_| \__,_|_| \__,_|_|_/__/ " -ForegroundColor Blue
Write-Host ""
Write-Host " Guardrails for AI Coders - Security Prompt Installer" -ForegroundColor Green
Write-Host " https://github.com/deepanshu-maliyan/guardrails-for-ai-coders" -ForegroundColor Cyan
Write-Host ""

# Check git is installed
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Error: git is required. Install from https://git-scm.com" -ForegroundColor Red
    exit 1
}

# Install or update
if (Test-Path $INSTALL_DIR) {
    Write-Host "Updating existing .ai-guardrails/ folder..." -ForegroundColor Yellow
    Set-Location $INSTALL_DIR
    git pull --quiet
    Set-Location ..
} else {
    Write-Host "Downloading guardrails-for-ai-coders..." -ForegroundColor Blue
    git clone --quiet $REPO_URL $INSTALL_DIR
}

# Add to .gitignore
if (Test-Path ".gitignore") {
    $content = Get-Content ".gitignore" -Raw
    if ($content -notmatch ".ai-guardrails") {
        Add-Content ".gitignore" "`n# Guardrails for AI Coders (local security prompts)"
        Add-Content ".gitignore" ".ai-guardrails/"
        Write-Host "Added .ai-guardrails/ to .gitignore" -ForegroundColor Green
    }
} else {
    Set-Content ".gitignore" ".ai-guardrails/"
    Write-Host "Created .gitignore with .ai-guardrails/" -ForegroundColor Green
}

Write-Host ""
Write-Host "====================================================" -ForegroundColor Green
Write-Host " Installation complete!" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Green
Write-Host ""
Write-Host " Your .ai-guardrails/ folder is ready." -ForegroundColor White
Write-Host ""
Write-Host " NEXT STEPS:" -ForegroundColor Yellow
Write-Host "  1. Open ChatGPT / Claude / Copilot Chat / Cursor" -ForegroundColor White
Write-Host "  2. Drag any file from .ai-guardrails\prompts\ into the chat" -ForegroundColor White
Write-Host "  3. Paste your code below and get an instant security review" -ForegroundColor White
Write-Host ""
Write-Host " POPULAR PROMPTS:" -ForegroundColor Yellow
Write-Host "  - .ai-guardrails\prompts\pr_security_review.prompt" -ForegroundColor Cyan
Write-Host "  - .ai-guardrails\prompts\secrets_scan.prompt" -ForegroundColor Cyan
Write-Host "  - .ai-guardrails\prompts\api_route_review.prompt" -ForegroundColor Cyan
Write-Host "  - .ai-guardrails\prompts\llm_app_red_team.prompt" -ForegroundColor Cyan
Write-Host ""
Write-Host " Star the repo if it helps: https://github.com/deepanshu-maliyan/guardrails-for-ai-coders" -ForegroundColor Magenta
Write-Host ""
