function la --wraps lsd --description "List contents of directory, including hidden files in directory using long format"
    lsd -lA $argv
end
