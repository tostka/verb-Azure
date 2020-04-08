#*------v Function get-AADBearToken v------
function get-AADBearToken {
    <#
    .SYNOPSIS
    get-AADBearToken .ps1 - retrieve an AzureAD auth token
    .NOTES
    Version     : 1.0.1
    Author      : Todd Kadrie
    Website     :	http://www.toddomation.com
    Twitter     :	@tostka / http://twitter.com/tostka
    CreatedDate : 2020-04-08
    FileName    : get-AADBearToken.ps1
    License     : MIT License
    Copyright   : (c) 2020 Todd Kadrie
    Github      : https://github.com/tostka
    Tags        : Powershell
    REVISIONS
    * 2:51 PM 4/8/2020 added CBH
    .DESCRIPTION
    get-AADBearToken .ps1 - retrieve an AzureAD auth token
    # Graph/AD connectivity constants
    $tenantId = $TORMeta['o365_TenantID'] # replace with your tenant ID
    $MSGraphURI = "https://graph.microsoft.com"
    $clientId = "1b730954-1685-4b74-9bfd-dac224a7b894" # Well-Known PowerShell clientId (used for this script)
    $redirectUri = "urn:ietf:wg:oauth:2.0:oob"
    .PARAMETER  tenantId
    AAD TenantID [-TenantID (guid)]
    .PARAMETER ShowDebug
    Parameter to display Debugging messages [-ShowDebug switch]
    .PARAMETER Whatif
    Parameter to run a Test no-change pass [-Whatif switch]
    .EXAMPLE
    $token=get-AADBearToken ;
    .LINK
    #>
    Param(
        [Parameter(HelpMessage = "AAD TenantID [-TenantID (guid)]]")]
        [string]$tenantId = $TORMeta['o365_TenantID'],
        [Parameter(HelpMessage = "Debugging Flag [-showDebug]")]
        [switch] $showDebug,
        [Parameter(HelpMessage = "Whatif Flag  [-whatIf]")]
        [switch] $whatIf
    ) ;
    $MSGraphURI = "https://graph.microsoft.com"
    $clientId = "1b730954-1685-4b74-9bfd-dac224a7b894" # Well-Known PowerShell clientId (used for this script)
    $redirectUri = "urn:ietf:wg:oauth:2.0:oob"
    $authority = "https://login.microsoftonline.com/$tenantId"
    $authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority
    $authResult = $authContext.AcquireToken("https://graph.microsoft.com", $clientId, $redirectUri, "Always")
    $token = $authResult.AccessToken
    if ($token -eq $null) {
        Write-Output "ERROR: Failed to get an Access Token" ;
        exit
    }
    else { $token | write-output }
} ; #*------^ END Function get-AADBearToken ^------