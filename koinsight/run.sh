#!/usr/bin/with-contenv bashio

# Parse configuration
DATA_PATH=$(bashio::config 'data_path')
LOG_LEVEL=$(bashio::config 'log_level')

# Set default data path if not specified
if [ -z "$DATA_PATH" ]; then
    DATA_PATH="/share/koinsight"
fi

# Create data directory if it doesn't exist
mkdir -p "$DATA_PATH"

# Set environment variables for KoInsight
export DATA_PATH="$DATA_PATH"
export LOG_LEVEL="$LOG_LEVEL"

# Log configuration
bashio::log.info "Starting KoInsight..."
bashio::log.info "Data path: $DATA_PATH"
bashio::log.info "Log level: $LOG_LEVEL"

# Create symlink for data persistence
if [ ! -L "/app/data" ]; then
    rm -rf /app/data 2>/dev/null || true
    ln -sf "$DATA_PATH" /app/data
fi

# Start KoInsight using the original entrypoint
cd /app
exec node apps/server/dist/app.js
