#! /usr/bin/env fish

set -l files (fd ".*sh" .)
for f in $files
    echo $f
end
