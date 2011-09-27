# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}  %? ↵%{$reset_color%})"

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
local git_branch='$(git_prompt_info)%{$reset_color%}'

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  gst=$(git_prompt_status)
  if [ $gst ]; then gst=": ${gst}"; fi
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${gst}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="  %{$fg[yellow]%}«"
ZSH_THEME_GIT_PROMPT_SUFFIX="»%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_ADDED="a"
ZSH_THEME_GIT_PROMPT_MODIFIED="m"
ZSH_THEME_GIT_PROMPT_RENAMED="r"
ZSH_THEME_GIT_PROMPT_DELETED="d"
ZSH_THEME_GIT_PROMPT_UNMERGED="M"

PROMPT="
╭── ${current_dir}: ${dircount}${git_branch}${return_code}
╰─ ${user_host} %{$fg[blue]%}${prompt_char}%{$reset_color%} "
