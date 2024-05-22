#!/bin/bash

REALM_VERSION=$1
XCODE_VERSION=$2

TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR

curl -L -O "https://github.com/realm/realm-swift/releases/download/v$REALM_VERSION/Realm.xcframework.zip"

REALM_CHECKSUM=$(swift package compute-checksum Realm.xcframework.zip)

curl -L -O "https://github.com/realm/realm-swift/releases/download/v$REALM_VERSION/RealmSwift@$XCODE_VERSION.xcframework.zip"

REALM_SWIFT_CHECKSUM=$(swift package compute-checksum RealmSwift@$XCODE_VERSION.xcframework.zip)

echo "REALM_CHECKSUM=$REALM_CHECKSUM" >> $GITHUB_ENV
echo "REALM_SWIFT_CHECKSUM=$REALM_SWIFT_CHECKSUM" >> $GITHUB_ENV

rm -rf $TEMP_DIR
