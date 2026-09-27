Install-Module Microsoft.Graph -Force
Connect-MgGraph -Scopes "Organization.ReadWrite.All"

Get-MgOrganization | Select-Object DisplayName, OnPremisesSyncEnabled

# Disable sync
$OrgID = (Get-MgOrganization).Id
Update-MgOrganization -OrganizationId $OrgID -BodyParameter @{ OnPremisesSyncEnabled = $false }
