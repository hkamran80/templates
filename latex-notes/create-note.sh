#!/bin/sh

LECTURE=$1
NAME=$2
DATE=$(date +'%B %d')
YEAR=$(date +%Y)

if [[ -z $LECTURE ]]; then
    echo "Missing lecture number".
    exit 2
fi

if [[ -z $NAME ]]; then
    echo "Missing name".
    exit 2
fi

NOTE_TEMPLATE="%! TEX root = ../notes.tex
% First argument to for the table of contents. Second argument is for the page.
\section[Lecture ${LECTURE}: ${NAME} (${DATE}, ${YEAR})]{Lecture ${LECTURE} (${DATE})}"

NOTE_LINE="input{lectures/lecture-${LECTURE}.tex}"

printf "%s" "$NOTE_TEMPLATE" > "$(pwd)/lectures/lecture-${LECTURE}.tex"

perl -0777 -pe "s/(.*\/lecture-\d+.tex[^\n]*)/\$1\n\\\input\{lectures\/lecture-${LECTURE}.tex\}/s" notes.tex > notes.tex.1
mv notes.tex.1 notes.tex
