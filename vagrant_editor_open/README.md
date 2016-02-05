## Vagrant Editor Open

It allows cmd+click on files on vagrant (SSH) to open directly in the editor.

You need to use iTerm and go to Profiles > Advanced > Semantic History, select "Always run command..." and put:

```
/Users/<YOUR-USERNAME>/.dotfiles/vagrant_editor_open/open.rb --b \3 --a \4
```

On the textbox. (replace `YOUR-USERNAME` with your username)
