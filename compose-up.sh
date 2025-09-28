#!/usr/bin/env bash
set -e

# Path to your compose stack
STACK_DIR="/mnt/user/PersonalFiles/Backups/compose-stack"

# All service files
FILES=$(find "$STACK_DIR" -maxdepth 1 -name "*.yml" -print | sort)
MON_FILES=$(find "$STACK_DIR/monitoring" -maxdepth 1 -name "*.yml" -print | sort)

# Combine both lists
COMPOSE_FILES=""
for f in $FILES $MON_FILES; do
  COMPOSE_FILES="$COMPOSE_FILES -f $f"
done

# Pass through any docker compose command (up, down, ps, logs, etc.)
docker compose $COMPOSE_FILES "$@"
