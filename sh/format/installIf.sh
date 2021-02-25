install_shellcheck(){
    sudo apt install shellcheck
}
install_shfmt(){
    sudo snap install shfmt
}

if [[ "$(shellcheck)" ]] && [[ "$(shfmt)" ]]; then
    echo "All needed apps are installed"
    exit 0
else 
    echo 'Error: shellcheck/shfmt is not installed.'
    install_shfmt
    install_shellcheck
    exit 0
fi

