#!/usr/bin/bash

if ! snapctl is-connected dotnet-runtime; then
    >&2 echo "Plug 'dotnet-runtime' isn't connected."
    >&2 echo "Please run: 'snap connect ${SNAP_NAME}:dotnet-runtime dotnet-runtime-80:dotnet-runtime'."
    exit 1
fi

DOTNET_HOST_PATH="$SNAP/usr/lib/dotnet/dotnet"

if [[ -f $DOTNET_HOST_PATH ]]; then
    $DOTNET_HOST_PATH "$SNAP"/opt/xamlplayground/XamlPlayground.NetCore.dll
else
    echo "No .NET Runtime found."
    exit 1
fi
