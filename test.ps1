<# 
This is the actual step that breaks the hybrid identity link.
Microsoft confirms that disabling sync converts all synced users to cloud‑only accounts. 
You must use Microsoft Graph PowerShell — the old MSOnline commands are deprecated. 
#>

Install-Module Microsoft.Graph -Force
Connect-MgGraph -Scopes "Organization.ReadWrite.All"

Get-MgOrganization | Select-Object DisplayName, OnPremisesSyncEnabled

# Disable sync
$OrgID = (Get-MgOrganization).Id
Update-MgOrganization -OrganizationId $OrgID -BodyParameter @{ OnPremisesSyncEnabled = $false }
