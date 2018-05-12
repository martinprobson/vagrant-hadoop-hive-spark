#!/bin/bash

source "/vagrant/scripts/common.sh"

function setupUtilities {
    # update the locate database
    updatedb
}

echo "finalize ubuntu"
setupUtilities
