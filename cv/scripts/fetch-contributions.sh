#!/usr/bin/env bash
# Refresh cv/assets/contributions.json from the GitHub GraphQL API (needs `gh auth login`).
# The CV draws the contribution calendar from this file; re-run and commit to update it.
set -euo pipefail
cd "$(dirname "$0")/.."
LOGIN="${1:-drshade}"
TO="$(date -u +%Y-%m-%dT23:59:59Z)"
FROM="$(date -u -d "$TO - 1 year + 1 day" +%Y-%m-%dT00:00:00Z)"
gh api graphql \
  -f login="$LOGIN" -f from="$FROM" -f to="$TO" \
  -f query='query($login:String!,$from:DateTime!,$to:DateTime!){
    user(login:$login){ contributionsCollection(from:$from,to:$to){
      contributionCalendar{ totalContributions
        weeks{ contributionDays{ date contributionCount contributionLevel } } } } } }' \
  | python3 -c '
import json,sys,datetime
cal=json.load(sys.stdin)["data"]["user"]["contributionsCollection"]["contributionCalendar"]
level={"NONE":0,"FIRST_QUARTILE":1,"SECOND_QUARTILE":2,"THIRD_QUARTILE":3,"FOURTH_QUARTILE":4}
out={"login":sys.argv[1],"fetched":datetime.date.today().isoformat(),
     "total":cal["totalContributions"],
     "weeks":[[{"date":d["date"],"count":d["contributionCount"],"level":level[d["contributionLevel"]]}
               for d in w["contributionDays"]] for w in cal["weeks"]]}
json.dump(out,open("assets/contributions.json","w"),separators=(",",":"))
print(out["total"], "contributions over", len(out["weeks"]), "weeks -> assets/contributions.json")
' "$LOGIN"
