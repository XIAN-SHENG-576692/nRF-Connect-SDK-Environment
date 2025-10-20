#!/usr/bin/env bash
# ============================================================
# Script Name: install_full_sdk_in_volume.sh
# ------------------------------------------------------------
# Purpose:
#   Install the nRF Connect SDK into the mounted volume within
#   this container environment.
#
# Description:
#   This script initializes and updates the nRF Connect SDK
#   inside the specified working directory.
#
# Usage:
#   chmod +x install_full_sdk.sh
#   ./install_full_sdk.sh
#
# Notes:
#   - This script must be run **inside the container**.
#   - Ensure that the target directory is correctly mounted.
#   - Requires network access to fetch SDK components via west.
#   - This script installs the full SDK and is therefore **not
#     suitable** for CI environments.
# ============================================================

# ------------------------------
# Configuration
# ------------------------------
source "$(dirname "$0")/variables.sh"

# ------------------------------
# Install the nRF Connect SDK
# ------------------------------
cd "$NCS_CONTAINER" || {
  echo "Error: Unable to access $NCS_CONTAINER"
  exit 1
}

echo "Initializing nRF Connect SDK in $NCS_CONTAINER..."
west init

echo "Updating SDK components..."
west update

echo "nRF Connect SDK installation completed successfully."
