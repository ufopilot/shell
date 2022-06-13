awk '
    function color(str, c){ return "\033["colors[c]"m"str"\033[0m"}
    function bg(str, c){ return "\033["bgcolors[c]"m"str"\033[0m"}
    function style(str, s){ return "\033["styles[s]"m"str"\033[0m" }
    function header(){
            printf "%-37s %-37s %-37s\n",
                bg(color(style("  header1  ", "bold"), "white"),"red"),
                bg(color(style("  header2  ", "bold"), "white"),"red"),
                bg(color(style("  header3  ", "bold"), "white"),"red")  
    }
    
    BEGIN{
        colors["black"] = 30;  colors["red"] = 31; colors["green-light"] = 32; colors["yellow"] = 33
        colors["green"] = 34; colors["magenta"] = 35; colors["blue"] = 36; colors["white"] = 37
        bgcolors["black"] = 40; bgcolors["red"] = 41; bgcolors["green"] = 42; bgcolors["yellow"] = 43;
        bgcolors["blue"] = 44; bgcolors["magenta"] = 45; bgcolors["cyan"] = 46; bgcolors["white"] = 47;
        styles["none"] = 0; styles["bold"] = 1; styles["italic"] = 3; styles["underscore"] = 4;
        styles["blink"] = 5; styles["reverseVideo"] = 7; styles["concealed"] = 8;
    }

    { 
        print color("RED","red")
        print color(style(style($0,"italic"), "bold"),"blue")
        print bg(color(style(" "$0" ", "bold"), "white"),"red") 
        print color(style(" italic ","italic"), "yellow") 
        print style(" string ", "underscore")
        printf "%-37s %-37s %-37s\n",
                bg(color(style("  header1  ", "bold"), "white"),"red"),
                bg(color(style("  header2  ", "bold"), "white"),"red"),
                bg(color(style("  header3  ", "bold"), "white"),"red") 
        printf "%-20s|%-20s|%-20s\n", 
                color("STRING", "yellow"), 
                #color("|", "red"), 
                color("STRING", "yellow"),
                #color("|", "red"), 
                color("STRING", "yellow")

        printf "%-20s|%-20s|%-20s\n", 
                color("STRING", "yellow"), 
                #color("|", "red"), 
                color("STRING", "yellow"),
                #color("|", "red"), 
                color("STRING", "yellow")
        header()
    }' <<<'String1 STRING2'