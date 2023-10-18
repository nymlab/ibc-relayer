#!/bin/sh
set -o errexit -o nounset -o pipefail

CONFIG_PATH=".relayer/config/config.yaml"

if [ -f "$CONFIG_PATH" ]; then
  echo "The file $CONFIG_PATH exists."
else
  echo "The file $CONFIG_PATH does not exist."

  echo "Generating rly configurations..."
  rly config init --memo "Nymlab Relayer"

  rly chains add -f ~/templates/chains/"$HUB_CHAIN".json
  rly chains add -f ~/templates/chains/"$REMOTE_CHAIN".json

  echo "$(rly chains list)"

  echo "Key $(rly keys restore $HUB_CHAIN relayer "$MNEMONIC") imported from $HUB_CHAIN to relayer..."
  echo "Key $(rly keys restore $REMOTE_CHAIN relayer "$MNEMONIC") imported from $REMOTE_CHAIN to relayer..."

  rly paths add $HUB_CHAIN $REMOTE_CHAIN "$HUB_CHAIN"__"$REMOTE_CHAIN" --file ~/templates/paths/"$HUB_CHAIN"__"$REMOTE_CHAIN".json
fi

rly start "$HUB_CHAIN"__"$REMOTE_CHAIN" 
