#!/bin/sh

# check for some basic arguments
case ${@} in
  --help|--version|"")
    docker run --rm -u "$(id -u):$(id -g)" mbentley/crudini "${@}"
    exit 0
    ;;
esac

# parse the parameters & find the first that does not have dashes; that should be the file
for PARAM in "${@}"
do
  # look for dashes to start the parameter
  if echo "${PARAM}" | grep -vq -- ^--
  then
    # if no dashes, we should have our file so set to variable and break from the for loop
    CRUDINI_FILE="${PARAM}"
    break
  fi
done

# check to see if the found file is really a file
if [ ! -f "${CRUDINI_FILE}" ]
then
  # passed file doesn't exist
  echo "ERROR: parsed file '${CRUDINI_FILE}' isn't actually a file - sorry, I tried..."
  exit 1
else
  # try to run the docker command
  docker run --rm -u "$(id -u):$(id -g)" -w /data -v "${CRUDINI_FILE}:${CRUDINI_FILE}" mbentley/crudini "${@}"
fi
