#*------v Function get-AADBearerTokenHeaders v------
Function get-AADBearerTokenHeaders {
    <#
    .SYNOPSIS
    get-AADBearerTokenHeaders .ps1 - retrieve an AzureAD auth token
    .NOTES
    Version     : 1.0.1
    Author      : Todd Kadrie
    Website     :	http://www.toddomation.com
    Twitter     :	@tostka / http://twitter.com/tostka
    CreatedDate : 2020-04-08
    FileName    : get-AADBearerTokenHeaders.ps1
    License     : MIT License
    Copyright   : (c) 2020 Todd Kadrie
    Github      : https://github.com/tostka
    Tags        : Powershell,Azure,Authentication,Rest
    REVISIONS
    * 2:51 PM 4/8/2020 added CBH
    .DESCRIPTION
    get-AADBearerTokenHeaders .ps1 - retrieve an AzureAD auth token
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
    $token=get-AADBearerTokenHeaders ;
    .LINK
    #>
    param( $token )

    Return @{
        "Authorization" = ("Bearer {0}" -f $token);
        "Content-Type"  = "application/json";
    }
}; 
#*------^ END Function get-AADBearerTokenHeaders ^------