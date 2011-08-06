#!/bin/sh
#
# Updates the contents of this repo with changes from upstream.

if [ -d syntax ]; then
  mkdir syntax
fi

cd syntax && wget -O - https://github.com/mitsuhiko/jinja2/tarball/master | tar xz --strip-components 3 --wildcards --no-anchored "*/ext/Vim"

if [ "$(git status --porcelain)" ]; then
  git add . && git commit -am "Changes from upstream."
fi
