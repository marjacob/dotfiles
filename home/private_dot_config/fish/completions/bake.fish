source /usr/share/fish/completions/make.fish

complete -c bake -n 'commandline -ct | string match -q "*=*"' \
    -a "(__fish_complete_make_targets (commandline -p))" -d Target

complete -f -c bake -n 'commandline -ct | not string match -q "*=*"' \
    -a "(__fish_complete_make_targets (commandline -p))" -d Target

complete -c bake -s f \
    -d "Use file as makefile" -r

complete -x -c bake -s C -l directory -x \
    -d "Change directory" \
    -a "(__fish_complete_directories (commandline -ct))"

complete -c bake -s d \
    -d "Debug mode"

complete -c bake -s e \
    -d "Environment before makefile"

complete -c bake -s i \
    -d "Ignore errors"

complete -x -c bake -s I \
    -d "Search directory for makefile" \
    -a "(__fish_complete_directories (commandline -ct))"

complete -f -c bake -s j \
    -d "Number of concurrent jobs (no argument means no limit)"

complete -c bake -s k \
    -d "Continue after an error"

complete -c bake -s l \
    -d "Start when load drops"

complete -c bake -s n \
    -d "Do not execute commands"

complete -c bake -s o -r \
    -d "Ignore specified file"

complete -c bake -s p \
    -d "Print database"

complete -c bake -s q \
    -d "Question mode"

complete -c bake -s r \
    -d "Eliminate implicit rules"

complete -c bake -s s \
    -d "Quiet mode"

complete -c bake -s S \
    -d "Don't continue after an error"

complete -c bake -s t \
    -d "Touch files, don't run commands"

complete -c bake -s v \
    -d "Display version and exit"

complete -c bake -s w \
    -d "Print working directory"

complete -c bake -s W -r \
    -d "Pretend file is modified"
