#!/bin/bash

# Function to install a specific tool
install_tool() {
    echo "Installing $1..."
    apt-get install -y $1
    echo "$1 installed successfully."
}

# Function for individual tool installation with menu
individual_install_menu() {
    PS3="Please select a tool to install (or type 'q' to quit): "
    select tool in \
        "iwconfig" \
        "net-tools (ifconfig)" \
        "nmap" \
        "netcat" \
        "tcpdump" \
        "wireshark" \
        "traceroute" \
        "hping3" \
        "sqlmap" \
        "zaproxy (OWASP ZAP)" \
        "wfuzz" \
        "nikto" \
        "dirb" \
        "sublist3r" \
        "wpscan" \
        "metasploit-framework" \
        "recon-ng" \
        "gobuster" \
        "hydra" \
        "john" \
        "aircrack-ng" \
        "sslscan" \
        "masscan" \
        "theharvester" \
        "maltego" \
        "shodan" \
        "amass" \
        "ncat" \
        "airmon-ng" \
        "ettercap-text-only" \
        "dnsenum" \
        "feroxbuster" \
        "faraday" \
        "dradis"; do
        
        case $REPLY in
            [1-9]|[1-2][0-9]|3[0-3])
                install_tool "$tool"
                ;;
            q|Q)
                echo "Exiting installation menu."
                break
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
    done
}

# Function to install all tools at once
install_all_tools() {
    tools=(
        "iwconfig"
        "net-tools"
        "nmap"
        "netcat"
        "tcpdump"
        "wireshark"
        "traceroute"
        "hping3"
        "sqlmap"
        "zaproxy"
        "wfuzz"
        "nikto"
        "dirb"
        "sublist3r"
        "wpscan"
        "metasploit-framework"
        "recon-ng"
        "gobuster"
        "hydra"
        "john"
        "aircrack-ng"
        "sslscan"
        "masscan"
        "theharvester"
        "maltego"
        "shodan"
        "amass"
        "ncat"
        "airmon-ng"
        "ettercap-text-only"
        "dnsenum"
        "feroxbuster"
        "faraday"
        "dradis"
    )

    for tool in "${tools[@]}"; do
        install_tool "$tool"
    done
}

# Main menu for the script
main_menu() {
    echo "Welcome to the Bug Bounty Tools Installer"
    PS3="Please choose an option (or type 'q' to quit): "
    options=("Install All Tools" "Install Tools Individually" "Quit")
    select opt in "${options[@]}"; do
        case $opt in
            "Install All Tools")
                install_all_tools
                break
                ;;
            "Install Tools Individually")
                individual_install_menu
                break
                ;;
            "Quit")
                echo "Exiting installer."
                break
                ;;
            *) 
                echo "Invalid option. Please try again."
                ;;
        esac
    done
}

# Run the main menu
main_menu
