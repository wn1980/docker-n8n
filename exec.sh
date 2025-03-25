#!/usr/bin/env bash

# Exit immediately if a command fails.
set -e

# Set variables
CONTAINER_NAME="n8n_custom"
USERNAME="node"
COMMAND="bash"  # e.g., "ls -l", "whoami", "bash"

# Construct the docker exec command
DOCKER_EXEC_COMMAND="docker exec -it -u $USERNAME $CONTAINER_NAME $COMMAND"

# Execute the command and handle potential errors
if $DOCKER_EXEC_COMMAND; then
  echo "Command executed successfully."
else
  echo "Command execution failed."
  exit 1 # Indicate an error
fi

# Example usage (Interactive shell):
# CONTAINER_NAME="my_web_container"
# USERNAME="www-data"
# COMMAND="bash"
# would give you a bash shell as user www-data inside the container my_web_container.

# Example usage(ls):
# CONTAINER_NAME="my_db_container"
# USERNAME="postgres"
# COMMAND="ls -l /var/lib/postgresql/data"
# Would list the postgres data directory.

# Example usage(whoami):
# CONTAINER_NAME="some_container"
# USERNAME="someuser"
# COMMAND="whoami"
# would return the username inside the container.
