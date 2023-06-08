#!/bin/bash



COLOR_RED='\e[31m'

COLOR_WHITE='\e[97m'

FONT_BOLD='\e[1m'

FONT_SIZE_300='\e[6m'

FONT_SIZE_200='\e[5m'

FONT_SIZE_100='\e[2m'

RESET='\e[0m'





display_ascii_art() {

    echo -e "${COLOR_RED}${FONT_BOLD}${FONT_SIZE_BIG}"

    echo -e " 

▒█░░▒█ ▒█▀▀▀ ▒█▀▀█ ▒█▀▀▀█ ▀█▀ ▀▀█▀▀ ▒█▀▀▀ 　 ▒█▀▀█ ▒█░░░ ▒█▀▀▀█ ▒█▄░▒█ ▀█▀ ▒█▄░▒█ ▒█▀▀█ 

▒█▒█▒█ ▒█▀▀▀ ▒█▀▀▄ ░▀▀▀▄▄ ▒█░ ░▒█░░ ▒█▀▀▀ 　 ▒█░░░ ▒█░░░ ▒█░░▒█ ▒█▒█▒█ ▒█░ ▒█▒█▒█ ▒█░▄▄ 

▒█▄▀▄█ ▒█▄▄▄ ▒█▄▄█ ▒█▄▄▄█ ▄█▄ ░▒█░░ ▒█▄▄▄ 　 ▒█▄▄█ ▒█▄▄█ ▒█▄▄▄█ ▒█░░▀█ ▄█▄ ▒█░░▀█ ▒█▄▄█"

    echo -e "${COLOR_WHITE}${FONT_BOLD}${FONT_SIZE_LARGE}"

    echo -e "Dᴇᴠ. Bʏ 𝕊𝕐𝔼𝔻 ℝ𝕀ℤ𝕎𝔸ℕ ℍ𝕀𝕃𝔸𝕃 𝕊ℍ𝔸ℍ\n${RESET}"

    echo -e "${COLOR_RED}${FONT_BOLD}${FONT_SIZE_MEDIUM}"

    echo -e "𝔾𝔻ℂ 𝔾𝕒𝕟𝕕𝕖𝕣𝕓𝕒𝕝\n${RESET}"

}





clone_website() {


    if [[ $1 == http* ]]; then

       

        domain=$(echo "$1" | awk -F/ '{print $3}')

     

        mkdir -p "$domain"

        


        wget -r -np -k -P "$domain" "$1"



        sed -i 's|href="/|href="./|g' "$domain"/*.html

        sed -i 's|src="/|src="./|g' "$domain"/*.html

        sed -i 's|url(/|url(./|g' "$domain"/*.html




        echo "#!/usr/bin/env python3" > "$domain/server.py"

        echo "import http.server" >> "$domain/server.py"

        echo "import socketserver" >> "$domain/server.py"

        echo "" >> "$domain/server.py"

        echo "PORT = 8080" >> "$domain/server.py"

        echo "" >> "$domain/server.py"

        echo "Handler = http.server.SimpleHTTPRequestHandler" >> "$domain/server.py"

        echo "" >> "$domain/server.py"

        echo "with socketserver.TCPServer(('', PORT), Handler) as httpd:" >> "$domain/server.py"

        echo "    print('Server running at http://localhost:' + str(PORT))" >> "$domain/server.py"

        echo "    httpd.serve_forever()" >> "$domain/server.py"

        

    else

        echo "Invalid URL. Please provide a URL starting with http or https."

    fi

}





display_ascii_art




echo -n "Enter the website URL: "

read url



clone_website "$url"
