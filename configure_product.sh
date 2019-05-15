#!/bin/bash
mv product.json product.json.bak

# set fields in product.json
extensionsGallery='setpath(["extensionsGallery"]; {"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery", "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index", "itemUrl": "https://marketplace.visualstudio.com/items"})'
nameShort='setpath(["nameShort"]; "VSCodium")'
nameLong='setpath(["nameLong"]; "VSCodium - Insiders")'
applicationName='setpath(["applicationName"]; "vscodium-insiders")'
win32MutexName='setpath(["win32MutexName"]; "vscodium-insiders")'
win32DirName='setpath(["win32DirName"]; "VSCodium-Insiders")'
win32NameVersion='setpath(["win32NameVersion"]; "VSCodium-Insiders")'
win32RegValueName='setpath(["win32RegValueName"]; "VSCodium-Insiders")'
win32AppUserModelId='setpath(["win32AppUserModelId"]; "Microsoft.VSCodium.Insiders")'
win32ShellNameShort='setpath(["win32ShellNameShort"]; "V&SCodium")'
win32x64UserAppId='setpath (["win32x64UserAppId"]; "{{2E1F05D1-C245-4562-81EE-28188DB6FD17}")'
urlProtocol='setpath(["urlProtocol"]; "vscodium")'
extensionAllowedProposedApi='setpath(["extensionAllowedProposedApi"]; getpath(["extensionAllowedProposedApi"]) + ["ms-vsliveshare.vsliveshare"])'
keyboardShortcutsUrlMac='setpath(["keyboardShortcutsUrlMac"]; "https://go.microsoft.com/fwlink/?linkid=832143")'
keyboardShortcutsUrlLinux='setpath(["keyboardShortcutsUrlLinux"]; "https://go.microsoft.com/fwlink/?linkid=832144")'
keyboardShortcutsUrlWin='setpath(["keyboardShortcutsUrlWin"]; "https://go.microsoft.com/fwlink/?linkid=832145")'

product_json_changes="${keyboardShortcutsUrlMac} | ${keyboardShortcutsUrlLinux} | ${keyboardShortcutsUrlWin} | ${extensionsGallery} | ${nameShort} | ${nameLong} | ${applicationName} | ${win32MutexName} | ${win32DirName} | ${win32NameVersion} | ${win32RegValueName} | ${win32AppUserModelId} | ${win32ShellNameShort} | ${win32x64UserAppId} | ${urlProtocol} | ${extensionAllowedProposedApi}"
cat product.json.bak | jq "${product_json_changes}" > product.json
cat product.json
