#!/bin/bash

echo "Checking Apache service..."

if systemctl is-active --quiet apache2; then
    echo "Apache is running successfully."
else
    echo "Apache is stopped. Attempting to restart..."

    if sudo systemctl restart apache2; then
        echo "Apache restarted successfully."
    else
        echo "ERROR: Apache could not be restarted."
        exit 1
    fi
fi

if systemctl is-active --quiet apache2; then
    echo "Apache service is active."
else
    echo "ERROR: Apache service is not active."
    exit 1
fi
