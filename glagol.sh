#!/bin/bash

CYAN="\033[0;36m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "                  ${RESET}"
echo -e "${CYAN}┏┓┓ ┏┓┏┓┏┓┓${RESET}"
echo -e "${GREEN}┃┓┃ ┣┫┃┓┃┃┃${RESET}"
echo -e "${YELLOW}┗┛┗┛┛┗┗┛┗┛┗┛ by KL3FT3Z (https://github.com/toxy4ny)${RESET}"
echo -e "Checker Method's in Https - Server${RESET}"

check_http_methods() {
    local url="$1"
    local methods=("PUT" "DELETE" "DEBUG" "CATS" "JEFF" "OPTIONS" "TRACE" "MKCOL" "LOCK")

    for method in "${methods[@]}"; do
        echo "[INFO] Checking Metod: $method in $url"
        
        response=$(curl -s -o /dev/null -w "%{http_code}" -X "$method" "$url")

        if [ "$response" -eq 200 ]; then
            echo "[SUCCESS] Method $method works! Enjoy! (Response: $response)."
        else
            echo "[INFO] Method $method not works:(( Admin is cool! (Response: $response)."
        fi
    done
}

main() {
    if [ -z "$1" ]; then
        echo "[ERROR] How to use tool: $0 <URL>"
        exit 1
    fi

    check_http_methods "$1"
}

main "$@"
