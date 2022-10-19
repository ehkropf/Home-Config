fish_vi_key_bindings

set -U fish_prompt_pwd_dir_length 0

# Remove mysteriously appearing "." from path.
set PATH (string match -v . $PATH)

# MacPort paths
set PATH /opt/local/bin /opt/local/sbin $PATH

# Own path
set PATH $PATH ~/bin ~/Library/Python/3.9/bin
