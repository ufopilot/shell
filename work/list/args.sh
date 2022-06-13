
FOO="foo variabe"

MYARGS=$(cat << EOF
    --a="asdf asdf"
    --b='2.61828'  
    --c=#foo
    --z="$FOO"
EOF
)

MOREARGS=$(cat << EOF
    --d="asdf asdf "
    --e=2.61828  
    --f=foo
EOF
)

echo $MYARGS $MOREARGS
