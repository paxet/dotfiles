function fish_greeting
    set_color $fish_color_autosuggestion
    echo (date "+%H:%M:%S")' | '(uname -o)' | '(whoami)'@'(hostname --fqdn)
    set_color normal
end
