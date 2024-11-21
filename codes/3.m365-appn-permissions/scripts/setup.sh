#!/usr/bin/env bash

# # login
# echo "Sign in to Microsoft 365..."
# npx -p @pnp/cli-microsoft365@7.10.0 -- m365 login --authType browser

# create AAD app
echo "Creating Entra app..."
appId=$(m365 entra app add --name M365Pune-M365Appn_Permission --multitenant --redirectUris http://localhost:3000 --apisDelegated https://graph.microsoft.com/Group.ReadWrite.All --grantAdminConsent --platform spa --query appId -o text)

# write app to env.js
echo "Writing app to env.js..."
echo "const appId = '$appId';" > ./src/env.js

# write scopes to env.js
echo "Writing scopes to env.js..."
echo "const scopes = ['Group.ReadWrite.All'];" >> ./src/env.js

echo "DONE"
