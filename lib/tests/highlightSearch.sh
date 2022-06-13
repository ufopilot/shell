awk '
    function color(str, c){ return "\033["colors[c]"m"str"\033[0m"}
    function bg(str, c){ return "\033["bgcolors[c]"m"str"\033[0m"}
    function style(str, s){ return "\033["styles[s]"m"str"\033[0m" }
    BEGIN{
        OFS="\t"
        colors["black"] = 30;  colors["red"] = 31; colors["green-light"] = 32; colors["yellow"] = 33
        colors["green"] = 34; colors["magenta"] = 35; colors["blue"] = 36; colors["white"] = 37
        bgcolors["black"] = 40; bgcolors["red"] = 41; bgcolors["green"] = 42; bgcolors["yellow"] = 43;
        bgcolors["blue"] = 44; bgcolors["magenta"] = 45; bgcolors["cyan"] = 46; bgcolors["white"] = 47;
        styles["none"] = 0; styles["bold"] = 1; styles["italic"] = 3; styles["underscore"] = 4;
        styles["blink"] = 5; styles["reverseVideo"] = 7; styles["concealed"] = 8;
    }
    $2=="0/1"
    { 
        first=$1"\t"$2"\t"$3"\t"$4"\t"$5
        second=$6"\t"$7"\t"$8"\t"$9"\t"$10
        $0=bg(first, "red")"\t"second       
    }
    $7=="0/1"{
        first=$1"\t"$2"\t"$3"\t"$4"\t"$5
        second=$6"\t"$7"\t"$8"\t"$9"\t"$10
        $0=bg(second, "red")"\t"first  
    }
    {
    print $0
}' data.2txt