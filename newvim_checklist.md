# Things to do

- [x] Markdown preview
-- Checked out the . They are all all browser based. I don't want them.
- [x] Delete words in insert mode with C-backspace
Failed in this one too. Its easier to just use Ctrl + w
- [x] Selective formatting
- [x] Delete without pasting
    Mappings have been modified
- [x] Going to symbol
- [x] Rename symbol
- [x] Copying files
- [x] Deleting files
- [x] Insert another line directly
Press o in normal mode
- [ ] Understand registers
- [ ] Replace words

## Rough pad

3. In a  paralle ,parallel dolphins were the dominant species, using advanced technology to explore the depths of space.

5. A mischievous squirrel darted across the park, cleverly avoiding the attempts of children trying to catch a glimpse of its acrobatic antics.

7. On a remote island, a group of scientists discovered a rare species of bioluminescent butterflies that lit up the night like living lanterns.
8. In a bustling city, street performers dazzled passersby with their mesmerizing talents, turning ordinary sidewalks into impromptu stages.

9. An aspiring astronaut gazed at the night sky, dreaming of exploring distant galaxies and uncovering the secrets of the universe.

10. Hidden within the pages of an old diary were the untold stories of a time traveler who journeyed through history, leaving behind subtle clues for future generations to discover.

## Selective formatting

I am going through [this link](https://www.youtube.com/watch?v=rOKL1pW1UUc&ab_channel=LearnLinuxTV)
this video is worth less. dont use this

Solved this using key binding
Went through a [reddit  article](https://www.reddit.com/r/neovim/comments/zv91wz/range_formatting/)

I am using <Leader>123 as short cut

## Test JSON

{
"a" : "test",
"b" : "test"
}

## Debugger setup

I am going to note down my lore of setting up debugger for Node JS. 
I have tried multiple times and failed (thank god for VCS on nvim configurations)

I have added the dependency of [mxsdev/nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js/tree/main)
at lua/dap.lua. 

Next, I have cloned [vscode-js-debug](https://github.com/microsoft/vscode-js-debug)
in nvim-data. We can get the exact nvim-data path with 
```
:lua =print(vim.fn.stdpath('data'))
```

For my system, this points to `C:\Users\TANMAY\AppData\Local\nvim-data`

I then manually built vscode-js-debug

```
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
```

*Update* :
I achieved some level of success. I can see the debug UI. But I am getting the below error
when trying to debug from docker
`Debug adapter didn't respond. Either the adapter is slow (then wait and ignore this) or there is a problem with your adapter or `pwa-node` configuration. Check the logs for errors (:help dap.set_log_level)`

It appears that rather than connecting to the local docker process,
I should connect to the remote node process.

I can now debug individual files. But its important to figure out how to attach
to process.

*Update*: I have been able to figure out the above things, in vs code (!sic)

I am trying to integrate the same in vim

[This video](https://youtu.be/Ul_WPhS2bis?feature=shared) will come in handy. Funny enough,
this is what I started with initially, however I spectacularly failed to set things up. Mostly because I am a vim noob and my astrovim configurations are vastly different than his.

[His configuration](https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/lua/plugins/dap.lua) will tell me
how to link vs code launch files with vim DAP.

He has a really nice snippet to enter the Chrome URL for
_launch and debug_ configuration

```
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Launch & Debug Chrome",
    url = function()
      local co = coroutine.running()
      return coroutine.create(function()
        vim.ui.input({
          prompt = "Enter URL: ",
          default = "http://localhost:3000",
        }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
      end)
    end,
    webRoot = vim.fn.getcwd(),
    protocol = "inspector",
    sourceMaps = true,
    userDataDir = false,
  }
```

## Mason configurations that I need

    ast-grep ast_grep
    biome
    js-debug-adapter
    lua-language-server lua_ls
    rust-analyzer rust_analyzer
    typescript-language-server tsserver

## Find diff between two files

https://neovim.discourse.group/t/how-to-compare-two-files/3285/2

If the two files are in two splits, try :windo diffthis.
Otherwise, try :diffsplit.

## Show both relative line numbers and absolute line numbers

`vim.o.statuscolumn = "%s %l %r"`

For some reason, this configuration is not working on my lua files. I  tried to add this on my user.lua
