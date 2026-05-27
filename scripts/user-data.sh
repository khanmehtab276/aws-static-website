#!/bin/bash

# ==============================================================================
# Script Name: user-data.sh
# Description: EC2 Bootstrapping script for automated Nginx deployment.
# Logs located at: /var/log/cloud-init-output.log
# ==============================================================================

# --- AUTOMATION SAFETY FLAGS ---
set -e # Exit immediately if any command fails
set -u # Exit immediately if an uninitialised variable is used

# Prevent apt-get from freezing the cloud-init process by waiting for user input
export DEBIAN_FRONTEND=noninteractive

echo "[USER-DATA] Starting EC2 bootstrapping..."

# --- SYSTEM UPDATE & INSTALLATION ---
echo "[USER-DATA] Updating package lists..."
apt-get update -yq

echo "[USER-DATA] Installing Nginx..."
apt-get install -yq nginx

# --- CONFIGURATION DEPLOYMENT ---
echo "[USER-DATA] Deploying index.html webpage..."
cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Khan's Terraform Website</title>
  <style>
    body { font-family: system-ui, sans-serif; text-align: center; padding: 50px; background: #f4f4f9; }
    card { background: white; padding: 30px; display: inline-block; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
  </style>
</head>
<body>
  <div class="card">
    <h1>Hello from Terraform Automation!</h1>
    <p>Deployed automatically using EC2 + Terraform + Nginx.</p>
  </div>
</body>
</html>
EOF

# Ensure web server can read the file
chmod 644 /var/www/html/index.html

# --- SERVICE MANAGEMENT ---
echo "[USER-DATA] Enabling and starting Nginx service..."
systemctl enable nginx
systemctl start nginx

# --- SANITY CHECK ---
if systemctl is-active --quiet nginx; then
    echo "[USER-DATA] SUCCESS: Nginx deployment finished successfully."
else
    echo "[USER-DATA] ERROR: Nginx failed to start." >&2
    exit 1
fi
