# Disable guest account
$guestAccount = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue

if ($guestAccount) {
    if (-not $guestAccount.Enabled) {
        Write-Host "Guest account is already disabled."
    }
    else {
        try {
            Disable-LocalUser -Name "Guest"
            Write-Host "Guest account has been successfully disabled."
        }
        catch {
            Write-Error "Failed to disable Guest account: $_"
        }
    }
}
else {
    Write-Warning "Guest account not found on this system."
}
