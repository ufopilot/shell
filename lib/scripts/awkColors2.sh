color (){
    local cl=$1
    shift 
    awk -v cl="$cl" '
        function color(c, str){ return "\033["colors[c]"m"str"\033[0m"}
        BEGIN{
            colors["black"] = 30;  colors["red"] = 31; 
            colors["green-light"] = 32; colors["yellow"] = 33
            colors["green"] = 34; colors["magenta"] = 35; 
            colors["blue"] = 36; colors["white"] = 37
        }
        { print color(cl,$0)}
    ' <<< "$@"
}

color red some text