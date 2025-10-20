#!/usr/bin/env bash
# ============================================================
# nRF Connect SDK DevContainer (Non-Root) - Bash Version
# ------------------------------------------------------------
# Purpose:
#   This script replicates the VS Code Dev Container environment
#   for Nordic nRF Connect SDK development directly in a terminal.
#
# Usage:
#   chmod +x pull_nrf_image.sh
#   ./pull_nrf_image.sh
# ============================================================

# ------------------------------
# Variables
# ------------------------------
source "$(dirname "$0")/variables.sh"

# ------------------------------
# Pull image from remote registry
# ------------------------------
echo "Pulling image '$IMAGE_NAME'..."
if podman pull "$IMAGE_NAME" --policy=newer; then
  echo "Image '$IMAGE_NAME' pulled successfully."
else
  echo "Failed to pull image '$IMAGE_NAME'."
  exit 1
fi
