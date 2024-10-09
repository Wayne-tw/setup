#!/usr/bin/env bash
set -eu

readonly vcs_uri="git@${GITHUB_HOST:-github.com}:"
readonly script_dir="$(dirname "${0}")/../../.."
readonly -a projects=(
    worthington10TW/setup
    worthington10TW/worthington10TW
    worthington10TW/gpio-build-monitor
    
    # twlabs/projector-backend
    # twlabs/projector-frontend

    adamtornhill/code-maat
    adamtornhill/MetricsTreeMap
    adamtornhill/FractalFigures

    kornysietsma/polyglot-code-explorer
    kornysietsma/polyglot-code-scanner
    kornysietsma/polyglot-code-offline-layout
)

function fetch() {
  local -r project="${1}"
  if project_exists "${project}"
  then
    echo -e "\nUpdating ${project}:" 1>&2
    git -C "${script_dir}/${project}" pull --rebase --autostash
  else
    echo 1>&2
    local -r group=$(dirname $project)
    mkdir -p "${script_dir}/${group}"
    git -C "${script_dir}/${group}" clone "${vcs_uri}/${project}"
  fi
}

function project_exists() {
  echo "${script_dir}/${1}"
  [[ -d "${script_dir}/${1}" ]]
}

function main() {
  echo 'Fetching projects...' 1>&2
  for project in "${projects[@]}"
  do
    fetch "${project}"
  done
}

main "$@"
