# IDE_vim
Integrated development environment (IDE) in vim.

## Instructions
* install vim
> sudo apt-get install vim
* if it doesn't exist already create a directory "autoload" inside .vim
> mkdir -p ~/.vim/autoload
* go to that directory
> cd ~/.vim/autoload
* download the plugin manager
> curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim
* if it doesn't exist already copy the 'vimrc' file in your home directory as '.vimrc'
* go inside vim
> vim
* install all plugins by calling PlugInstall inside vim
> :PlugInstall!
* Change the following variable
TIMEOUT_SECONDS = 0.5 to 2 in file with path ~/.vim/YouCompleteMe/python/ycm/client/completion_request.py

