if [[ ! -o interactive ]]; then
    return
fi

compctl -K _box box

_box() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(box commands)"
  else
    completions="$(box completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
