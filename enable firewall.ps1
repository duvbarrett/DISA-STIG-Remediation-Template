# Enable firewall rules
$profiles = Get-NetFirewallProfile

foreach ($profile in $profiles) {
    if (-not $profile.Enabled) {
        Write-Host "$($profile.Name) Firewall is disabled. Enabling..."
        try {
            Set-NetFirewallProfile -Profile $profile.Name -Enabled True
            Write-Host "$($profile.Name) Firewall enabled successfully."
        }
        catch {
            Write-Error "Failed to enable $($profile.Name) Firewall: $_"
        }
    }
    else {
        Write-Host "$($profile.Name) Firewall is already enabled."
    }
}
