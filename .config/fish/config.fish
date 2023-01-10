fish_vi_key_bindings

# Want the whole directory.
set fish_prompt_pwd_dir_length 0

# Remove mysteriously appearing "." from path.
set PATH (string match -v . $PATH)

# MacPort paths
set PATH /opt/local/bin /opt/local/sbin $PATH

# Own path
set PATH $PATH ~/bin ~/.local/bin

# Not set on Mac when invoking from iTerm2. O_o
set -gx SHELL (type -p fish)
