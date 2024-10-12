#!/usr/bin/env bash
NAMES_FILE=names.txt
NAMES_DIR=names
[ -f ${NAMES_FILE} ] || {
    echo "FATAL | ${NAMES_FILE} does not exist!"
    echo "exiting"
    exit 1
}

echo "INFO | deleting dir ${NAMES_DIR}"
rm -rf "${NAMES_DIR}"

while read name
do
    name=${name//[$'\t\r\n ']}
    NAME_DIR=${NAMES_DIR}/${name}
    
    echo "INFO | creating dir ${NAME_DIR}"
    mkdir -p "${NAME_DIR}"

    CONFIG_PATH="${NAME_DIR}/config.txt"
    echo "INFO | creating ${CONFIG_PATH}"
    echo "This is a config file for ${name}" > ${CONFIG_PATH}
done < ${NAMES_FILE}

