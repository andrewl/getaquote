#!/bin/bash

# @todo - some cacheing?
# @todo - error handling

# Configuration
# The quotes file to use (excluding .txt suffix)
DEFAULT_QUOTES=alan-partridge

# The url to retrieve them from
DEFAULT_URL_ROOT=https://raw.githubusercontent.com/andrewl/getaquote/master/quotes
# End of configuration



GQ_QUOTES=${GQ_QUOTES:-$DEFAULT_QUOTES}
GQ_URL_ROOT=${GQ_URL_ROOT:-$DEFAULT_URL_ROOT}

URL=$GQ_URL_ROOT/$GQ_QUOTES.txt

IFS=$'\n' QUOTES=($(curl -s $URL))

INDEX=$( jot -r 1  0 $((${#QUOTES[@]} - 1)) )

SELECTED_QUOTE=${QUOTES[$INDEX]}

echo $SELECTED_QUOTE
