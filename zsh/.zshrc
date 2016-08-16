export ZSH=/Users/zhengxingcheng/.oh-my-zsh

ZSH_THEME="zxc-gnzh"

plugins=(sudo git brew node npm osx history-substring-search vi-mode)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

source $ZSH/oh-my-zsh.sh

# 使用vim的时候调用7.4版本的vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

#alias for tnpm
alias tnpm="npm --registry=http://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=http://npm.taobao.org/dist --userconfig=$HOME/.cnpmrc"

#alias for npm from yonyou
alias ynpm="npm --registry=http://npm.xq5.com.cn"

# 设置默认账户，不现实用户名那一长串
# 现在用的模板里面没有
# DEFAULT_USER="zxc"


##在命令前插入 sudo {{{
#定义功能
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    #光标移动到行末
    zle end-of-line
}
zle -N sudo-command-line
##定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}

#命令别名 {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -al'
alias grep='grep --color=auto'

alias -s html=vi   # 在命令行直接输入后缀为 html 的文件名，会在 vim 中打开,如果想用TextMate打开可以将vi改成mate
alias -s rb=vi     # 在命令行直接输入 ruby 文件，会在 vim 中打开
alias -s py=vi     # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'  #表示自动解压后缀为 gz 的压缩包。
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
#thefuck
alias fuck='eval $(thefuck $(fc -ln -1))'

#[Esc][h] man 当前命令时，显示简短说明
alias run-help >&/dev/null && unalias run-help
autoload run-help
bindkey "\eh" run-help

#svn diff没有高亮，用vim打开diff信息
function sd() { svn diff $* | vim -}

#}}}

#路径别名 {{{
#进入相应的路径时只要 cd ~xxx
hash -d D="/Users/zhengxingcheng/data/"
hash -d Y="/Users/zhengxingcheng/work/yonyou"
#}}}


#设置svn设置的默认编辑器
export SVN_EDITOR=vim

#for jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#for nvm
export NVM_DIR=~/.nvm
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
source $(brew --prefix nvm)/nvm.sh
