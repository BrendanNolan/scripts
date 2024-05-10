#! /usr/bin/env fish

function print_word
    argparse 'w/word=' -- $argv
    echo "normal:"
    echo $_flag_word
    echo "string escape:"
    echo (string escape $_flag_word)
    echo "string escape --style=regex:"
    echo (string escape --style=regex $_flag_word)
end

print_word $argv
