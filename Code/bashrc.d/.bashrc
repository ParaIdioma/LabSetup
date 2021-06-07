for file in /mnt/WD/todo/MainPC/bashrc.d/*.active
do
  source $file
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
