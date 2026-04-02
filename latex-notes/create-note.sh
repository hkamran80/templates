#!/bin/sh

# Automatically defined variables
DATE=$(date +'%B %-d')
YEAR=$(date +%Y)

# User-defined variables
LECTURE=$1
NAME=$2
TYPE_NUM=$3

# Required variable validation
if [[ -z $LECTURE ]]; then
    echo "Missing lecture number".
    exit 2
fi

if [[ -z $NAME ]]; then
    echo "Missing name".
    exit 2
fi

# NOTE: To add more types in the future, add a new `elif` clause with an incremented number and an updated `TYPE`.
# Also ensure that the directory exists.
if [[ (-z $TYPE_NUM) || ($TYPE_NUM -eq 1) ]]; then
    # If $TYPE_NUM is not set or set to 1
    echo "Creating lecture."
    TYPE="Lecture"
elif [[ $TYPE_NUM -eq 2 ]]; then
    # If $TYPE_NUM is set to 2
    echo "Creating discussion."
    TYPE="Discussion"
fi

TYPE_LOWER=$(echo "${TYPE}" | tr '[:upper:]' '[:lower:]')

# Templates
NOTE_TEMPLATE="%! TEX root = ../notes.tex
% First argument to for the table of contents. Second argument is for the page.
\section[${TYPE} ${LECTURE}: ${NAME} (${DATE}, ${YEAR})]{${TYPE} ${LECTURE} (${DATE})}"

NOTE_LINE="input{${TYPE_LOWER}s/${TYPE_LOWER}-${LECTURE}.tex}"

# Output
printf "%s" "$NOTE_TEMPLATE" > "$(pwd)/${TYPE_LOWER}s/${TYPE_LOWER}-${LECTURE}.tex"

perl -0777 -pe "s/(.*\/(lecture|discussion)-\d+.tex[^\n]*)/\$1\n\\\input\{${TYPE_LOWER}s\/${TYPE_LOWER}-${LECTURE}.tex\}/s" notes.tex > notes.tex.1
mv notes.tex.1 notes.tex
