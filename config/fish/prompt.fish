function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  if not test $last_status -eq 0
    set_color $fish_color_error
  end
  echo ""
  echo -n " ├─ "

  set_color $fish_color_cwd
  set -U fish_prompt_pwd_dir_length 0
  echo -n (prompt_pwd)
  set_color normal

  __informative_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo ""
  echo -n ' └─ $ '

end
