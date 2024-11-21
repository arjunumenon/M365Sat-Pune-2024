# 2. Demo: Simulate errors in your Microsoft 365 appn using Dev Proxy

## Index

- [2. Demo: Simulate errors in your Microsoft 365 appn using Dev Proxy](#2-demo-simulate-errors-in-your-microsoft-365-appn-using-dev-proxy)
  - [Index](#index)
  - [Summary](#summary)
  - [Compatibility](#compatibility)
  - [Prerequisites](#prerequisites)
  - [Run the demo](#run-the-demo)
    - [Configure Azure AD App Registration](#configure-azure-ad-app-registration)
      - [PowerShell 7](#powershell-7)
      - [bash](#bash)
      - [Manual](#manual)
  - [References](#references)
  - [Disclaimer](#disclaimer)

## Summary

This sample contains a demo web application connected to Microsoft Graph. Using Dev Proxy, you can simulate random errors returned by Microsoft Graph and see how the app handles them.

## Compatibility

![Dev Proxy v0.23.0](https://img.shields.io/badge/devproxy-v0.23.0-green.svg)

## Prerequisites

- [Microsoft 365 developer tenant](https://aka.ms/m365/devprogram)
- [Node.js LTS](https://nodejs.org)

## Run the demo

- Ensure that the Entra App Registration is completed as described in the [Configure Azure AD App Registration](#appreg) section
- Start the sample app by running `npx lite-server`
- Start Dev Proxy with the Microsoft 365 preset by running `devproxy --config-file "~appFolder/presets/m365.json"`
- In a web browser, navigate to `http://localhost:3000` and interact with the sample app to see how it handles random errors

### <a id="appreg">Configure Azure AD App Registration</a>

There are two ways which you can configure the App Registration required for the samples to work correctly, through automation using either a `bash` or `pwsh` script we provide for you in the `scripts` directory, or manually through Azure Portal.

> Note that the script will create a file called `env.js`, in the root of the `samples` directory. This file contains the client ID of the application registration that is created.

#### <a id="pwsh">PowerShell 7</a>

> The script uses CLI for Microsoft 365 to authenticate with and create the app registration in your tenant, therefore requires nodejs, v8 or greater to be installed

```sh
PS > cd ./samples/
PS > ./scripts/setup.ps1
```

Follow the prompts in the terminal.

#### <a id="bash">bash</a>

> The script uses CLI for Microsoft 365 to authenticate with and create the app registration in your tenant, therefore requires nodejs, v8 or greater to be installed

```sh
$ > cd ./samples/
$ > chmod +x /scripts/setup.sh
$ > ./scripts/setup.sh
```

Follow the prompts in the terminal.

#### <a id="manual">Manual</a>

The following table provides details of how to configure your app registration.

| Property | Value |
| ---- | ---- |
| Name | dev-proxy-samples |
| Account types | Accounts in any organizational directory (Any Azure AD directory - Multitenant) |
| Platform type | Single-page application |
| Redirect URIs | http://localhost:3000/withsdk.html <br> http://localhost:3000/nosdk.html |
| API Permissions | Microsoft Graph <br> User.Read.All (Delegate) w/ Admin Consent <br> Presence.Read.All |

After creating the app registration, create a file called `env.js` in the root of the `samples` directory with the following contents, replacing `<clientid>` with the value which can be copied from the portal.

```js
const appId = '<clientid>';
```
## References

This sample is created from the Sample Reference already available in the [Microsoft 365 Dev Proxy Samples](https://github.com/pnp/proxy-samples/tree/main/samples/demo-m365-randomerror-js) which is created and pubished by [Waldek Mastykarz](https://github.com/waldekmastykarz).


## Disclaimer

**THIS CODE IS PROVIDED *AS IS* WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
