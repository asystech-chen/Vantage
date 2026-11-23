#!/usr/bin/env bash
# Build Vantage WinUpdater (C#, net472 + WinForms) on Linux/macOS/Windows.
# The output is a small IL executable; no .NET runtime is bundled — Windows
# 10 1809+ and Windows 11 ship .NET Framework 4.7.2/4.8.
set -euo pipefail

cd "$(dirname "$0")"
DOTNET="${DOTNET:-$HOME/.dotnet/dotnet}"

if ! command -v "$DOTNET" >/dev/null 2>&1; then
  echo "error: dotnet SDK not found (looked for $DOTNET)" >&2
  echo "       set DOTNET=/path/to/dotnet or install the .NET SDK" >&2
  exit 1
fi

"$DOTNET" build src/Vantage-WinUpdater.csproj -c Release -v minimal

cp "src/bin/Release/net472/Vantage-WinUpdater.exe" .
echo
ls -lh Vantage-WinUpdater.exe
