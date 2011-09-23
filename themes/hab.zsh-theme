# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $(id -u) = 0 ]]; then 
  local prompt_char='#'
  local host_color='red'
else
  local prompt_char='$'
  local host_color='green'
fi
local user_host='%{$fg[${host_color}]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[cyan]%}%~%{$reset_color%}'
local dircount='$(ls -1 | wc -l | sed "s: ::g")'

PROMPT="
╭── ${current_dir}: ${dircount}
╰─ ${user_host} %{$fg[blue]%}${prompt_char}%{$reset_color%} "
RPS1="${return_code}"
