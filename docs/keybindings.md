# nvim2k Keybindings

Here are all the keybindings defined for nvim2k.

Check out the source code of individual files for more info.

Sources:

- [Which Key](../lua/plugins/tools/which-key.lua) - Biggest source of keybindings, fully documented.
- [General](../lua/core/keys.lua) - Changes behavior of core keys, not documented here.
- Individual plugin configs - Check out the source code of individual files in [plugins](../lua/plugins/) for more info.

## Leader Bindings (Normal Mode)

> Leader key is set to `<Space>`.

### a - AI

| Keybinding                         | Action         |
| ---------------------------------- | -------------- |
| <key>Leader</key> <key> a c </key> | Copilot Chat   |
| <key>Leader</key> <key> a d </key> | Docs           |
| <key>Leader</key> <key> a e </key> | Explain        |
| <key>Leader</key> <key> a f </key> | Fix            |
| <key>Leader</key> <key> a F </key> | Fix Diagnostic |
| <key>Leader</key> <key> a g </key> | Commit         |
| <key>Leader</key> <key> a G </key> | Commit Staged  |
| <key>Leader</key> <key> a l </key> | Load Chat      |
| <key>Leader</key> <key> a o </key> | Optimize       |
| <key>Leader</key> <key> a r </key> | Review         |
| <key>Leader</key> <key> a s </key> | Save Chat      |
| <key>Leader</key> <key> a t </key> | Tests          |

### b - Debugging

| Keybinding                         | Action        |
| ---------------------------------- | ------------- |
| <key>Leader</key> <key> b b </key> | Breakpoint    |
| <key>Leader</key> <key> b c </key> | Continue      |
| <key>Leader</key> <key> b i </key> | Into          |
| <key>Leader</key> <key> b l </key> | Last          |
| <key>Leader</key> <key> b o </key> | Over          |
| <key>Leader</key> <key> b O </key> | Out           |
| <key>Leader</key> <key> b r </key> | Repl          |
| <key>Leader</key> <key> b R </key> | Restart Frame |
| <key>Leader</key> <key> b t </key> | Debugger      |
| <key>Leader</key> <key> b x </key> | Exit          |

### c - Code

| Keybinding                         | Action            |
| ---------------------------------- | ----------------- |
| <key>Leader</key> <key> c d </key> | Root Directory    |
| <key>Leader</key> <key> c f </key> | Format File       |
| <key>Leader</key> <key> c F </key> | Fix Tabs          |
| <key>Leader</key> <key> c r </key> | Reload Module     |
| <key>Leader</key> <key> c R </key> | Reload Configs    |
| <key>Leader</key> <key> c o </key> | Dashboard         |
| <key>Leader</key> <key> c c </key> | Highlight Colors  |
| <key>Leader</key> <key> c h </key> | Hardtime          |
| <key>Leader</key> <key> c l </key> | Clean Empty Lines |
| <key>Leader</key> <key> c m </key> | Markdown Preview  |
| <key>Leader</key> <key> c n </key> | Notifications     |
| <key>Leader</key> <key> c p </key> | Pick Color        |
| <key>Leader</key> <key> c P </key> | Convert Color     |
| <key>Leader</key> <key> c x </key> | Run File          |

### d - Database

| Keybinding                         | Action      |
| ---------------------------------- | ----------- |
| <key>Leader</key> <key> d b </key> | DB Explorer |
| <key>Leader</key> <key> d j </key> | DB Next     |
| <key>Leader</key> <key> d k </key> | DB Prev     |
| <key>Leader</key> <key> d s </key> | To CSV      |
| <key>Leader</key> <key> d S </key> | To JSON     |
| <key>Leader</key> <key> d t </key> | To Table    |

### e - Edit

| Keybinding                         | Action            |
| ---------------------------------- | ----------------- |
| <key>Leader</key> <key> e a </key> | Alternate File    |
| <key>Leader</key> <key> e c </key> | Config            |
| <key>Leader</key> <key> e d </key> | Config Dir        |
| <key>Leader</key> <key> e e </key> | Explorer          |
| <key>Leader</key> <key> e f </key> | File Under Cursor |
| <key>Leader</key> <key> e l </key> | Local Config      |
| <key>Leader</key> <key> e m </key> | Readme            |
| <key>Leader</key> <key> e n </key> | New File          |
| <key>Leader</key> <key> e z </key> | Zsh Config        |

### f - Find

| Keybinding                         | Action             |
| ---------------------------------- | ------------------ |
| <key>Leader</key> <key> f a </key> | All Files          |
| <key>Leader</key> <key> f b </key> | Buffers            |
| <key>Leader</key> <key> f c </key> | File Commits       |
| <key>Leader</key> <key> f f </key> | Find files         |
| <key>Leader</key> <key> f g </key> | Find Text          |
| <key>Leader</key> <key> f l </key> | Location List      |
| <key>Leader</key> <key> f m </key> | Modified files     |
| <key>Leader</key> <key> f o </key> | Find in Open Files |
| <key>Leader</key> <key> f p </key> | Last Search        |
| <key>Leader</key> <key> f q </key> | Quickfix           |
| <key>Leader</key> <key> f r </key> | Recent Files       |
| <key>Leader</key> <key> f s </key> | Fuzzy Find in File |
| <key>Leader</key> <key> f t </key> | Panel              |
| <key>Leader</key> <key> f u </key> | Undo History       |
| <key>Leader</key> <key> f w </key> | Find Word          |

### g - Git

| Keybinding                           | Action          |
| ------------------------------------ | --------------- |
| <key>Leader</key> <key> g a </key>   | Stage Hunk      |
| <key>Leader</key> <key> g A </key>   | Stage Buffer    |
| <key>Leader</key> <key> g b </key>   | Blame           |
| <key>Leader</key> <key> g c </key>   | Find Commits    |
| <key>Leader</key> <key> g C </key>   | Co-Authors      |
| <key>Leader</key> <key> g d </key>   | Diff            |
| <key>Leader</key> <key> g f </key>   | Fugitive Panel  |
| <key>Leader</key> <key> g g </key>   | Lazygit         |
| <key>Leader</key> <key> g i </key>   | Hunk Info       |
| <key>Leader</key> <key> g j </key>   | Next Hunk       |
| <key>Leader</key> <key> g k </key>   | Prev Hunk       |
| <key>Leader</key> <key> g l </key>   | Log             |
| <key>Leader</key> <key> g p </key>   | Pull            |
| <key>Leader</key> <key> g P </key>   | Push            |
| <key>Leader</key> <key> g r </key>   | Reset Hunk      |
| <key>Leader</key> <key> g R </key>   | Reset Buffer    |
| <key>Leader</key> <key> g s </key>   | Switch Branch   |
| <key>Leader</key> <key> g S </key>   | Stashed Changes |
| <key>Leader</key> <key> g t b </key> | Blame           |
| <key>Leader</key> <key> g t d </key> | Deleted         |
| <key>Leader</key> <key> g t l </key> | Line HL         |
| <key>Leader</key> <key> g t n </key> | Number HL       |
| <key>Leader</key> <key> g t s </key> | Signs           |
| <key>Leader</key> <key> g t w </key> | Word Diff       |
| <key>Leader</key> <key> g u </key>   | Undo Stage Hunk |
| <key>Leader</key> <key> g v </key>   | Select Hunk     |

### h - Help

| Keybinding                         | Action           |
| ---------------------------------- | ---------------- |
| <key>Leader</key> <key> h h </key> | Help Pages       |
| <key>Leader</key> <key> h i </key> | Inspect Position |
| <key>Leader</key> <key> h k </key> | Hover Doc        |
| <key>Leader</key> <key> h m </key> | Man Pages        |

### i - Insert

| Keybinding                         | Action        |
| ---------------------------------- | ------------- |
| <key>Leader</key> <key> i d </key> | Date          |
| <key>Leader</key> <key> i e </key> | Emojis        |
| <key>Leader</key> <key> i f </key> | File Name     |
| <key>Leader</key> <key> i n </key> | Nerd Glyphs   |
| <key>Leader</key> <key> i P </key> | Absolute Path |
| <key>Leader</key> <key> i p </key> | Relative Path |
| <key>Leader</key> <key> i r </key> | Registers     |
| <key>Leader</key> <key> i t </key> | Time          |

### j - Jump

| Keybinding                         | Action            |
| ---------------------------------- | ----------------- |
| <key>Leader</key> <key> j c </key> | Word              |
| <key>Leader</key> <key> j d </key> | Diagnostics       |
| <key>Leader</key> <key> j f </key> | Jumplist          |
| <key>Leader</key> <key> j h </key> | Backward          |
| <key>Leader</key> <key> j j </key> | Remote            |
| <key>Leader</key> <key> j k </key> | Treesitter        |
| <key>Leader</key> <key> j l </key> | Forward           |
| <key>Leader</key> <key> j n </key> | Search Forward    |
| <key>Leader</key> <key> j N </key> | Search Backward   |
| <key>Leader</key> <key> j p </key> | Previous Jump     |
| <key>Leader</key> <key> j s </key> | Search            |
| <key>Leader</key> <key> j t </key> | Remote Treesitter |
| <key>Leader</key> <key> j w </key> | Current Word      |

### k - Keys

| Keybinding                         | Action          |
| ---------------------------------- | --------------- |
| <key>Leader</key> <key> k c </key> | Commands        |
| <key>Leader</key> <key> k h </key> | Command History |
| <key>Leader</key> <key> k k </key> | Keymaps         |
| <key>Leader</key> <key> k s </key> | Search History  |

### l - LSP

| Keybinding                         | Action                |
| ---------------------------------- | --------------------- |
| <key>Leader</key> <key> l a </key> | Code Action           |
| <key>Leader</key> <key> l d </key> | Peek Definition       |
| <key>Leader</key> <key> l f </key> | Finder                |
| <key>Leader</key> <key> l F </key> | References            |
| <key>Leader</key> <key> l g </key> | Goto Definition       |
| <key>Leader</key> <key> l h </key> | Hover                 |
| <key>Leader</key> <key> l i </key> | LSP Info              |
| <key>Leader</key> <key> l j </key> | Next Diagnostic       |
| <key>Leader</key> <key> l k </key> | Prev Diagnostic       |
| <key>Leader</key> <key> l L </key> | Workspace Diagnostics |
| <key>Leader</key> <key> l l </key> | File Diagnostics      |
| <key>Leader</key> <key> l o </key> | Outline               |
| <key>Leader</key> <key> l p </key> | Incoming Calls        |
| <key>Leader</key> <key> l P </key> | Outgoing Calls        |
| <key>Leader</key> <key> l q </key> | Stop LSP              |
| <key>Leader</key> <key> l Q </key> | Restart LSP           |
| <key>Leader</key> <key> l R </key> | Replace               |
| <key>Leader</key> <key> l r </key> | Rename                |
| <key>Leader</key> <key> l s </key> | Document Symbols      |
| <key>Leader</key> <key> l S </key> | Workspace Symbols     |
| <key>Leader</key> <key> l T </key> | Goto Type Definition  |
| <key>Leader</key> <key> l t </key> | Peek Type Definition  |

### Marks

| Keybinding                           | Action              |
| ------------------------------------ | ------------------- |
| <key>Leader</key> <key> m b </key>   | Bookmarks           |
| <key>Leader</key> <key> m d </key>   | Delete Line         |
| <key>Leader</key> <key> m D </key>   | Delete Buffer       |
| <key>Leader</key> <key> m h </key>   | Next Bookmark       |
| <key>Leader</key> <key> m j </key>   | Next                |
| <key>Leader</key> <key> m k </key>   | Previous            |
| <key>Leader</key> <key> m l </key>   | Previous Bookmark   |
| <key>Leader</key> <key> m m </key>   | All Marks           |
| <key>Leader</key> <key> m n 1 </key> | Next Bookmark 1     |
| <key>Leader</key> <key> m n 2 </key> | Next Bookmark 2     |
| <key>Leader</key> <key> m n 3 </key> | Next Bookmark 3     |
| <key>Leader</key> <key> m n 4 </key> | Next Bookmark 4     |
| <key>Leader</key> <key> m p 1 </key> | Previous Bookmark 1 |
| <key>Leader</key> <key> m p 2 </key> | Previous Bookmark 2 |
| <key>Leader</key> <key> m p 3 </key> | Previous Bookmark 3 |
| <key>Leader</key> <key> m p 4 </key> | Previous Bookmark 4 |
| <key>Leader</key> <key> m P </key>   | Preview             |
| <key>Leader</key> <key> m s </key>   | Set Next            |
| <key>Leader</key> <key> m t </key>   | Toggle              |
| <key>Leader</key> <key> m x </key>   | Delete Bookmark     |
| <key>Leader</key> <key> m 1 </key>   | Toggle Bookmark 0   |
| <key>Leader</key> <key> m 2 </key>   | Toggle Bookmark 2   |
| <key>Leader</key> <key> m 3 </key>   | Toggle Bookmark 3   |
| <key>Leader</key> <key> m 4 </key>   | Toggle Bookmark 4   |

### n - Notes

| Keybinding                         | Action           |
| ---------------------------------- | ---------------- |
| <key>Leader</key> <key> n d </key> | Today's Todo     |
| <key>Leader</key> <key> n e </key> | Today's Entry    |
| <key>Leader</key> <key> n f </key> | All Notes        |
| <key>Leader</key> <key> n g </key> | Find Notes       |
| <key>Leader</key> <key> n h </key> | Yesterday's Todo |
| <key>Leader</key> <key> n l </key> | Tomorrow's Todo  |
| <key>Leader</key> <key> n n </key> | New Note         |
| <key>Leader</key> <key> n s </key> | Commit Note      |
| <key>Leader</key> <key> n t </key> | Incomplete Todos |
| <key>Leader</key> <key> n x </key> | Toggle Todo      |

### o - Options

| Keybinding                         | Action           |
| ---------------------------------- | ---------------- |
| <key>Leader</key> <key> o c </key> | Colorscheme      |
| <key>Leader</key> <key> o h </key> | Highlight Colors |
| <key>Leader</key> <key> o n </key> | Relative Numbers |
| <key>Leader</key> <key> o o </key> | All Options      |

### p - Packages

| Keybinding                         | Action  |
| ---------------------------------- | ------- |
| <key>Leader</key> <key> p c </key> | Check   |
| <key>Leader</key> <key> p d </key> | Debug   |
| <key>Leader</key> <key> p i </key> | Install |
| <key>Leader</key> <key> p l </key> | Log     |
| <key>Leader</key> <key> p m </key> | Mason   |
| <key>Leader</key> <key> p P </key> | Profile |
| <key>Leader</key> <key> p p </key> | Plugins |
| <key>Leader</key> <key> p r </key> | Restore |
| <key>Leader</key> <key> p s </key> | Sync    |
| <key>Leader</key> <key> p u </key> | Update  |
| <key>Leader</key> <key> p x </key> | Clean   |

### q - Quit

| Keybinding                         | Action         |
| ---------------------------------- | -------------- |
| <key>Leader</key> <key> q a </key> | Quit All       |
| <key>Leader</key> <key> q b </key> | Close Buffer   |
| <key>Leader</key> <key> q d </key> | Delete Buffer  |
| <key>Leader</key> <key> q f </key> | Force Quit     |
| <key>Leader</key> <key> q q </key> | Quit           |
| <key>Leader</key> <key> q s </key> | Close Split    |
| <key>Leader</key> <key> q w </key> | Write and Quit |

### r - Refactor

| Keybinding                         | Action               |
| ---------------------------------- | -------------------- |
| <key>Leader</key> <key> r b </key> | Replace Buffer       |
| <key>Leader</key> <key> r d </key> | Go To Definition     |
| <key>Leader</key> <key> r e </key> | Extract Block        |
| <key>Leader</key> <key> r f </key> | Extract To File      |
| <key>Leader</key> <key> r h </key> | List Definition Head |
| <key>Leader</key> <key> r i </key> | Inline Variable      |
| <key>Leader</key> <key> r j </key> | Next Usage           |
| <key>Leader</key> <key> r k </key> | Previous Usage       |
| <key>Leader</key> <key> r l </key> | List Definition      |
| <key>Leader</key> <key> r n </key> | Swap Next            |
| <key>Leader</key> <key> r p </key> | Swap Previous        |
| <key>Leader</key> <key> r R </key> | Refactor Commands    |
| <key>Leader</key> <key> r r </key> | Smart Rename         |
| <key>Leader</key> <key> r S </key> | Replace              |
| <key>Leader</key> <key> r s </key> | Replace Word         |
| <key>Leader</key> <key> r v </key> | Extract Variable     |
| <key>Leader</key> <key> r w </key> | Replace Word         |

### s - Split

| Keybinding                         | Action           |
| ---------------------------------- | ---------------- |
| <key>Leader</key> <key> s ` </key> | Previous Window  |
| <key>Leader</key> <key> s \ </key> | Split Right      |
| <key>Leader</key> <key> s / </key> | Split Below      |
| <key>Leader</key> <key> s a </key> | Vertical Split   |
| <key>Leader</key> <key> s c </key> | Close Tab        |
| <key>Leader</key> <key> s f </key> | First Tab        |
| <key>Leader</key> <key> s h </key> | Move Left        |
| <key>Leader</key> <key> s H </key> | Decrease Width   |
| <key>Leader</key> <key> s j </key> | Move Down        |
| <key>Leader</key> <key> s J </key> | Decrease Height  |
| <key>Leader</key> <key> s k </key> | Move Up          |
| <key>Leader</key> <key> s K </key> | Increase Height  |
| <key>Leader</key> <key> s l </key> | Move Right       |
| <key>Leader</key> <key> s L </key> | Increase Width   |
| <key>Leader</key> <key> s p </key> | Previous Pane    |
| <key>Leader</key> <key> s q </key> | Close Split      |
| <key>Leader</key> <key> s s </key> | Horizontal Split |

### t - Terminal

| Keybinding                         | Action              |
| ---------------------------------- | ------------------- |
| <key>Leader</key> <key> t ` </key> | Horizontal Terminal |
| <key>Leader</key> <key> t c </key> | Rails Console       |
| <key>Leader</key> <key> t n </key> | Node                |
| <key>Leader</key> <key> t p </key> | Python              |
| <key>Leader</key> <key> t r </key> | Ruby                |
| <key>Leader</key> <key> t s </key> | Horizontal Terminal |
| <key>Leader</key> <key> t t </key> | Terminal            |
| <key>Leader</key> <key> t v </key> | Vertical Terminal   |

### u - Test

| Keybinding                         | Action           |
| ---------------------------------- | ---------------- |
| <key>Leader</key> <key> u c </key> | Run Current Test |
| <key>Leader</key> <key> u f </key> | Run Test File    |
| <key>Leader</key> <key> u o </key> | Test Output      |
| <key>Leader</key> <key> u s </key> | Test Summary     |

### v - Select

| Keybinding                         | Action         |
| ---------------------------------- | -------------- |
| <key>Leader</key> <key> v B </key> | Around Bracket |
| <key>Leader</key> <key> v b </key> | Bracket        |
| <key>Leader</key> <key> v P </key> | Around Para    |
| <key>Leader</key> <key> v p </key> | Paragraph      |
| <key>Leader</key> <key> v Q </key> | Around Quote   |
| <key>Leader</key> <key> v q </key> | Quote          |

### w - Writing

| Keybinding                         | Action         |
| ---------------------------------- | -------------- |
| <key>Leader</key> <key> w c </key> | Spellcheck     |
| <key>Leader</key> <key> w f </key> | Force Write    |
| <key>Leader</key> <key> w j </key> | Next Misspell  |
| <key>Leader</key> <key> w k </key> | Prev Misspell  |
| <key>Leader</key> <key> w q </key> | Write and Quit |
| <key>Leader</key> <key> w s </key> | Suggestions    |
| <key>Leader</key> <key> w t </key> | Twilight       |
| <key>Leader</key> <key> w w </key> | Write and Quit |
| <key>Leader</key> <key> w z </key> | ZenMode        |

### x - Exit

| Keybinding                       | Action        |
| -------------------------------- | ------------- |
| <key>Leader</key> <key> x </key> | Save and Quit |

### y - Yank

| Keybinding                         | Action          |
| ---------------------------------- | --------------- |
| <key>Leader</key> <key> y a </key> | Copy Whole File |
| <key>Leader</key> <key> y f </key> | File Name       |
| <key>Leader</key> <key> y g </key> | Copy Git URL    |
| <key>Leader</key> <key> y P </key> | Absolute Path   |
| <key>Leader</key> <key> y p </key> | Relative Path   |

## Leader Bindings (Visual Mode)

### a - AI

| Keybinding                         | Action         |
| ---------------------------------- | -------------- |
| <key>Leader</key> <key> a c </key> | Copilot Chat   |
| <key>Leader</key> <key> a d </key> | Docs           |
| <key>Leader</key> <key> a e </key> | Explain        |
| <key>Leader</key> <key> a f </key> | Fix            |
| <key>Leader</key> <key> a F </key> | Fix Diagnostic |
| <key>Leader</key> <key> a g </key> | Commit         |
| <key>Leader</key> <key> a G </key> | Commit Staged  |
| <key>Leader</key> <key> a o </key> | Optimize       |
| <key>Leader</key> <key> a r </key> | Review         |
| <key>Leader</key> <key> a t </key> | Tests          |

### c - Code

| Keybinding                         | Action                |
| ---------------------------------- | --------------------- |
| <key>Leader</key> <key> c i </key> | Sort Case Insensitive |
| <key>Leader</key> <key> c S </key> | Sort Desc             |
| <key>Leader</key> <key> c s </key> | Sort Asc              |
| <key>Leader</key> <key> c u </key> | Unique                |
| <key>Leader</key> <key> c x </key> | Run Code              |

### g - Git

| Keybinding                         | Action     |
| ---------------------------------- | ---------- |
| <key>Leader</key> <key> g a </key> | Stage Hunk |
| <key>Leader</key> <key> g r </key> | Reset Hunk |

### j - Jump

| Keybinding                         | Action            |
| ---------------------------------- | ----------------- |
| <key>Leader</key> <key> j d </key> | Diagnostics       |
| <key>Leader</key> <key> j j </key> | Remote            |
| <key>Leader</key> <key> j k </key> | Treesitter        |
| <key>Leader</key> <key> j n </key> | Search Forward    |
| <key>Leader</key> <key> j N </key> | Search Backward   |
| <key>Leader</key> <key> j p </key> | Previous Jump     |
| <key>Leader</key> <key> j s </key> | Search            |
| <key>Leader</key> <key> j t </key> | Remote Treesitter |
| <key>Leader</key> <key> j w </key> | Current Word      |

### l - LSP

| Keybinding                         | Action            |
| ---------------------------------- | ----------------- |
| <key>Leader</key> <key> l a </key> | Range Code Action |

### r - Refactor

| Keybinding                         | Action            |
| ---------------------------------- | ----------------- |
| <key>Leader</key> <key> r r </key> | Refactor Commands |
| <key>Leader</key> <key> r e </key> | Extract Function  |
| <key>Leader</key> <key> r f </key> | Extract To File   |
| <key>Leader</key> <key> r v </key> | Extract Variable  |
| <key>Leader</key> <key> r i </key> | Inline Variable   |

### y - Yank

| Keybinding                         | Action       |
| ---------------------------------- | ------------ |
| <key>Leader</key> <key> y g </key> | Copy Git URL |

## Non Leader Bindings

| Keybinding                         | Action                 |
| ---------------------------------- | ---------------------- |
| K                                  | LSP Hover              |
| Q                                  | Force Quit!            |
| U                                  | Redo                   |
| <key>Shift</key> + <key>H</key>    | Previous Buffer        |
| <key>Shift</key> + <key>L</key>    | Next Buffer            |
| <key>Ctrl</key> + <key>H</key>     | Move Left              |
| <key>Ctrl</key> + <key>J</key>     | Move Down              |
| <key>Ctrl</key> + <key>K</key>     | Move Up                |
| <key>Ctrl</key> + <key>L</key>     | Move Right             |
| <key>Ctrl</key> + <key>Up</key>    | Increase window height |
| <key>Ctrl</key> + <key>Down</key>  | Decrease window height |
| <key>Ctrl</key> + <key>Left</key>  | Decrease window width  |
| <key>Ctrl</key> + <key>Right</key> | Increase window width  |
| <key>Ctrl</key> + <key>F</key>     | Find Files             |
| <key>Ctrl</key> + <key>G</key>     | Lazygit                |

### [ - Previous

| Keybinding                | Action       |
| ------------------------- | ------------ |
| <key>[</key> <key>b</key> | Buffer       |
| <key>[</key> <key>c</key> | Change       |
| <key>[</key> <key>B</key> | First Buffer |
| <key>[</key> <key>d</key> | Diagnostic   |
| <key>[</key> <key>e</key> | Edit         |
| <key>[</key> <key>g</key> | Git Hunk     |
| <key>[</key> <key>j</key> | Jump         |

### ] - Next

| Keybinding                | Action      |
| ------------------------- | ----------- |
| <key>]</key> <key>b</key> | Buffer      |
| <key>]</key> <key>c</key> | Change      |
| <key>]</key> <key>B</key> | Last Buffer |
| <key>]</key> <key>d</key> | Diagnostic  |
| <key>]</key> <key>e</key> | Edit        |
| <key>]</key> <key>g</key> | Git Hunk    |
| <key>]</key> <key>j</key> | Jump        |
