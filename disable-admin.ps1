 # Disable the built-in admin account
$adminAccount = Get-LocalUser -Name "Administrator" -ErrorAction SilentlyContinue

if ($adminAccount) {
    if (-not $adminAccount.Enabled) {
        Write-Host "Administrator account is already disabled."
    }
    else {
        try {
            Disable-LocalUser -Name "Administrator"
            Write-Host "Administrator account has been successfully disabled."
        }
        catch {
            Write-Error "Failed to disable Administrator account: $_"
        }
    }
}
else {
    Write-Warning "Administrator account not found on this system."
} 
