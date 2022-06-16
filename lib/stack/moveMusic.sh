#!/bin/bash

    dir="."
    find "$dir" -regex '.*\.\([mM][pP][34]\|[mM][kK][vV]\)'| \
    awk -F/ '{print "mv "$0" /tmp/Papierkorb/"$(NF-1)"_"$NF}'