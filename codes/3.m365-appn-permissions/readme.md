# 3. Improve app security when calling Microsoft Graph API using Dev Proxy

## Index

- [3. Improve app security when calling Microsoft Graph API using Dev Proxy](#3-improve-app-security-when-calling-microsoft-graph-api-using-dev-proxy)
  - [Index](#index)
  - [Summary](#summary)
  - [Compatibility](#compatibility)
  - [Demo Process](#demo-process)
    - [Prerequisites Steps (One time setup)](#prerequisites-steps-one-time-setup)
    - [Checking for minimal permissions](#checking-for-minimal-permissions)
    - [Check if you are using excessive permissions](#check-if-you-are-using-excessive-permissions)
  - [Fixing app permissions](#fixing-app-permissions)
  - [Reset app permissions](#reset-app-permissions)
  - [References](#references)
  - [Disclaimer](#disclaimer)

## Summary

This sample demonstrates how to use Dev Proxy to improve your app security when calling Microsoft Graph API.

## Compatibility

![Dev Proxy v0.23.0](https://img.shields.io/badge/devproxy-v0.23.0-green.svg)

## Demo Process

### Prerequisites Steps (One time setup)

1. Run `npm install` to install project dependencies
2. Run the setup script to create a Microsoft Entra app registration
    1. PowerShell
        1. Execute `.\scripts\setup.ps1`
    2. bash
        1. Execute `chmod +x ./scripts/setup.sh` to make the script an executable
        2. Execute `./scripts/setup.sh`

### Checking for minimal permissions

If you work on a large solution that uses many endpoints, it can be difficult to build the exact list of minimal permissions for your application.

To check for minimal permissions locally:

1. Start the local web server, `npm start`
2. Start Dev Proxy, `devproxy --config-file .devproxy/minimal-permissions.json --urls-to-watch "https://graph.microsoft.com/*" --record`
3. Navigate to `http://localhost:3000`, login and wait for the table to be populated
4. Stop recording mode, press <kbd>S</kdb>
5. Stop Dev Proxy, press <kbd>Ctrl</kbd> + <kbd>C</kbd>

The minimal scopes for the tracked requests are shown in the console output.

### Check if you are using excessive permissions

A common approach to security is to apply the principle of least privilege (PoLP). This principle applies to users, processes and programs.

To check your access token for excessive permissions locally:

1. Start the local web server, `npm start`
2. Start Dev Proxy in recording mode, `devproxy --config-file .devproxy/excessive-permissions.json --urls-to-watch "https://graph.microsoft.com/*" --record`
3. Navigate to `http://localhost:3000`, login and wait for the table to be populated
4. Stop recording mode, press <kbd>S</kdb>
5. Stop Dev Proxy, press <kbd>Ctrl</kbd> + <kbd>C</kbd>
6. Stop the local web server, press <kbd>Ctrl</kbd> + <kbd>C</kbd>

The guidance is shown in the console output.

## Fixing app permissions

To fix the app permissions and apply the principle of least privilege:

1. Run the fix script to update permissions and scopes
    1. PowerShell
        1. Execute `.\scripts\fix.ps1`
    1. bash
        1. Execute `chmod +x ./scripts/fix.sh` to make the script an executable
        1. Execute `./scripts/fix.sh`

The script will:

1. Replace the `Group.ReadWrite.All` scope with `Tasks.Read` in `src\env.js`
2. Remove the service principal
3. Create a new service principal
4. Add the `Tasks.Read` delegated permission and grant admin consent
5. Remove the `Group.ReadWrite.All` delegated permission

## Reset app permissions

To reset the app permissions to the original state:

1. Run the reset script to update permissions and scopes
    1. PowerShell
        1. Execute `.\scripts\reset.ps1`
    2. bash
        1. Execute `chmod +x ./scripts/reset.sh` to make the script an executable
        2. Execute `./scripts/reset.sh`

The script will:

1. Replace the `Tasks.Read` scope with `Group.ReadWrite.All` in `src\env.js`
2. Remove the service principal
3. Create a new service principal
4. Add the `Group.ReadWrite.All` delegated permission and grant admin consent
5. Remove the `Tasks.Read` delegated permission


## References

This sample is created from the Sample Reference already available in the [Microsoft 365 Dev Proxy Samples](https://github.com/pnp/proxy-samples/tree/main/samples/improve-app-security-graph) which is created and pubished by [Waldek Mastykarz](https://github.com/waldekmastykarz) & [Garry Trinder](https://github.com/garrytrinder).

## Disclaimer

**THIS CODE IS PROVIDED *AS IS* WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
