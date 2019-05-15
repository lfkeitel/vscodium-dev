#!/bin/bash
set -e
./get_repo.sh

cp -rp src/* vscode/
cd vscode

export npm_config_arch="x64"
export npm_config_target_arch="x64"
../update_settings.sh
yarn
../configure_product.sh
../undo_telemetry.sh

sed -i "s/code-oss/vscodium/" resources/linux/debian/postinst.template
npm run gulp -- "vscode-linux-x64-min"
# . ../create_appimage.sh

cd ..
