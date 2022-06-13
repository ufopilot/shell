!abc { xyz: "ABC", queue: "TEST" },
!abc { xyz: "TES", queue: "TEST" },
!abc { xyz: "HYJ", queue: "TEST" },
!abc { xyz: "VVB", queue: "TEST" },

string='!abc { xyz: "ABC", queue: "TEST" }'
# awk -F\" '{print $2}' <<<"$string"

echo $string | awk -F "[:,]" '{print $2}'| sed -e 's/"//' -e 's/"$//'