# bash completion for tremc(1)           -*- shell-script -*-

_tremc () {
  local cur prev opts

  _get_comp_words_by_ref cur prev

  opts="-h --help -v --version -c --connect -s --ssl -f --config --create-config -n --netrc -d --debug -k --list-keys -l --list-actions -X --skip-version-check --permissive -p --profile -r --reverse-dns"

  if [[ ${cur} == -* ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  else
    case "${prev}" in
      -c|--connect)
        # no completion, wait for user input
        ;;
      -p|--profile)
        COMPREPLY=($(  cat ~/.config/tremc/settings.cfg | grep ^profile"$cur" | cut -d' ' -f 1 | sed s/^profile// ))
        ;;
      -f|--config)
        # dirs and files
        _filedir
        ;;
      *)
        # dirs and torrents
        _filedir torrent
        ;;
    esac
  fi
}

complete -F _tremc tremc

# ex: ts=4 sw=4 et filetype=sh
