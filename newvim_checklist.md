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
in nvim-data. We can get the exact of nvim-data with 
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

Update:
I acheived some level of success. I can see the debug UI. But I am getting the below error
when trying to debug from docker
`Debug adapter didn't respond. Either the adapter is slow (then wait and ignore this) or there is a problem with your adapter or `pwa-node` configuration. Check the logs for errors (:help dap.set_log_level)`

I can not debug individual files. But its important to figure out how to attach
to process.
