#!/usr/bin/env bash

# # login
# echo "Sign in to Microsoft 365..."
# npx -p @pnp/cli-microsoft365@7.10.0 -- m365 login --authType browser

# read the contents of env/src.js
filePath="./src/env.js"
envJs=$(cat $filePath)

# extract the appId from the first line of the file
appId=$(echo "$envJs" | head -n 1 | cut -d "'" -f 2)

# replace scopes values in env.js
echo "Replacing scopes in env.js..."
newScope='const scopes = ["https://graph.microsoft.com/Tasks.Read"];'
sed -i '' "s|const scopes = \[.*\];|$newScope|" $filePath

# get service principal id
echo "Getting service principal id..."
displayName=$(m365 entra enterpriseapp get --id "$appId" --query displayName -o text)

# remove the service principal
echo "Removing the service principal..."
m365 entra enterpriseapp remove --displayName "$displayName" --force

# create a new service principal
echo "Creating a new service principal..."
m365 entra enterpriseapp add --id "$appId"

# add the Task.Read permission
echo "Adding the Tasks.Read permission..."
m365 entra app permission add --appId "$appId" --delegatedPermissions https://graph.microsoft.com/Tasks.Read --grantAdminConsent

# remove the Group.ReadWrite.All permission
echo "Removing the Group.ReadWrite.All permission..."
m365 entra app permission remove --appId "$appId" --delegatedPermissions https://graph.microsoft.com/Group.ReadWrite.All --force

echo "DONE"