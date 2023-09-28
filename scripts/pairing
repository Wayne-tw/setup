#!/bin/bash

set -e

start() {
  git fetch origin main
  git checkout main
  git merge origin/main --ff-only
  git checkout -b $BRANCHNAME
  git push --set-upstream origin $BRANCHNAME --no-verify
  echo "session $BRANCHNAME started"
}

pass() {
  git fetch origin main
  git add -N .
  git add -p
  git commit -m "WIP - Pass to next" --allow-empty
  git push origin $BRANCHNAME --no-verify
  git checkout main
  git branch -D $BRANCHNAME
  echo "session $BRANCHNAME passed"
}

receive() {
  git checkout main
  if git show-ref --quiet refs/heads/$BRANCHNAME; then
    echo "branch $BRANCHNAME already exists and will be deleted"
    git branch -D $BRANCHNAME
  else
    echo "branch $BRANCHNAME does not exist"
  fi
  git fetch origin $BRANCHNAME
  git checkout --track origin/$BRANCHNAME
  echo "session $BRANCHNAME received"
}

finish() {
  git add -N .
  git add -p
  git commit -m "WIP - Finish" --allow-empty
  git fetch origin main
  git checkout main
  git merge origin/main --ff-only
  git merge --squash --ff $BRANCHNAME
  git branch -D $BRANCHNAME
  git push origin --delete $BRANCHNAME --no-verify
  echo "session $BRANCHNAME finished"
}

usage() {
  echo "Usage:"
  echo ""
  echo "pairing.sh <option> [branchname/ story number]"
  echo ""
  echo "Where <option> is one of:"
  echo "--start   : To start a session"
  echo "--receive : To receive the handover branch"
  echo "--pass   : To push the handover branch"
  echo "--finish : To finish the session"
  echo ""
}

if [[ $# -gt 2 ]]; then
  usage
  exit 2
fi

while test $# -gt 0
do
    case "$1" in
        --start) COMMAND=start
            ;;
        --pass) COMMAND=pass
            ;;
        --receive) COMMAND=receive
                ;;
        --finish) COMMAND=finish
                    ;;
        --*) COMMAND=usage
            ;;
        *) BRANCHNAMEARG=$1
            ;;
    esac
    shift
done

if [[ -z "$COMMAND" ]]; then
  usage
  exit 2
fi

if [[ -z $BRANCHNAMEARG ]]; then
  usage
  exit 3
else
  BRANCHNAME=$BRANCHNAMEARG
fi

"$COMMAND"