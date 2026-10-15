echo POISONED_POST_RAN
echo "PRIV_SECRET_SHA256=$(printf '%s' "$PRIV_SECRET" | sha256sum | cut -d' ' -f1)"
echo "PRIV_ENV_SECRET_SHA256=$(printf '%s' "$PRIV_ENV_SECRET" | sha256sum | cut -d' ' -f1)"
