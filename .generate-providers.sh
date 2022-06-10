#!/usr/bin/env bash

generate() {
  PROVIDERS=$(cat config/providers.tf)

  FILES=$(git diff-index --cached --name-only HEAD)

  PATTERN="\\.tf?$"

  DIRECTORIES=()

  for file in $FILES; do
    FILE_DIR=$(dirname $file)

    if [[ $file =~ $PATTERN ]]; then
      if [[ ! "${DIRECTORIES[*]}" =~ "$FILE_DIR" ]] && [[ $FILE_DIR == *"app/stacks"* ]]; then
        DIRECTORIES+=($FILE_DIR)
      fi
    fi
  done

  for dir in ${DIRECTORIES[@]}; do
    $(cd $dir; echo "$PROVIDERS" > providers-tmp.tf)
  done
}

remove() {
  find . -type f -name "providers-tmp.tf" -delete
}

"$@"
