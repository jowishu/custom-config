# Neovim Custom Config

该仓库包含了我日常使用的 Neovim 的配置文件, 主要目录说明如下:

```text
├── after
│   └── queries                     ## 对 cpp 和 Python 启用拼写检查
│       ├── cpp
│       └── python
├── colors                          ## 配色方案, 暗色系
│   └── distinguished.vim
├── ftplugin                        ## 针对 llvm-ir, machine-ir 和 tablegen 文件类型加载时被触发
│   ├── llvm.vim
│   ├── mir.vim
│   └── tablegen.vim
├── indent                          ## 针对 llvm-ir 的缩进设置
│   └── llvm.vim
├── init.lua                        ## Neovim 的 Lua 配置入口文件
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── autocmd.lua             ## 针对不同文件类型的自动命令
│   │   ├── colortheme.lua          ## 启用上面的配色方案
│   │   ├── keymaps.lua             ## 快捷键集中存放的文件
│   │   ├── options.lua             ## Common neovim options 设置
│   │   └── snippets.lua            ## snippets 设置
│   └── plugins                     ## 插件目录
│       ├── autocmp.lua             ## 代码补全插件
│       ├── bigfile.lua             ## 大文件显示插件, 文件超过一定大小会 disable 语法高亮
│       ├── codecompanion.lua       ## Neovim AI 助手插件
│       ├── formatting.lua          ## 代码格式化插件, 支持不同编程语言的格式化
│       ├── gitsigns.lua            ## 和 git 相关的符号
│       ├── glow.lua                ## Markdown 文件渲染插件 `:Glow`
│       ├── indent-blankline.lua    ## 文件内代码 indent 插件
│       ├── leetcode.lua            ## leetcode 刷题插件
│       ├── lsp.lua                 ## lsp 相关配置
│       ├── lualine.lua             ## neovim 状态栏配置插件
│       ├── luasnip.lua             ## snippets 插件
│       ├── misc.lua                ## 一些不需要复杂配置的插件, fugitive, autopairs, todo-comments etc.
│       ├── neo-tree.lua            ## 侧边目录树
│       ├── svnj.lua                ## SVN 操作
│       ├── telescope.lua           ## telescope, 主要是做模糊查找的
│       └── treesitter.lua          ## treesitter, 语法高亮
├── minimal-vimrc                   ## 采用 vimscript 实现的 minimal vimrc, 提供常用配置 
├── prompts                         ## 为 codecompanion 自定义实现的 prompts
│   ├── CodeExplain.md
│   ├── CodeFix.md
│   └── CodeTest.md
├── README.md
└── syntax                          ## 特定类型文件的语法高亮, 来自 llvm 仓库
    ├── fbs.vim
    ├── llvm.vim
    ├── machine-ir.vim
    ├── mir.vim
    └── tablegen.vim
```

## 如何使用

将仓库 clone 下来将 nvim 目录软连接到 `~/.config/nvim` 下.

## 常用快捷键说明

|模式|键位|说明|
|:---|:---|:---|
| n | `space` | leader 键 |
| n | `<CR>` | 开启一个新的 tab |
| n | `<C-d>` | 向下翻半页, 并将光标至于中间 |
| n | `<C-u>` | 向上翻半页, 并将光标至于中间 |
| n | `<C-n>` | 下一个 buffer |
| n | `<C-c>` | 关闭最近的 tab |
| n | `<C-e>` | 打开文件目录树 |
| n | `<C-l>` | 使用 Navbuddy 打开文件的大纲视图 |
| n | `<C-s>` | c++ 文件中头文件和实现文件互相跳转 |
| n | `<C-x>` | c++ 中根据 lsp 的提示快速修复代码 |
| n | `<leader>x` | 关闭 buffer |
| n | `<leader>b` | 开启新的 buffer |
| n | `<leader>v` | 竖直分屏 |
| n | `<leader>h` | 水平分屏 |
| n | `<leader>d` | 切换 lsp 显示的详细信息 |
| n | `<leader>cc` | 切换 CodeCompanion 的聊天窗口 |
| v | `<` | 向左 indent |
| v | `>` | 向右 indent |
| v | `<leader>cp` | 触发 CodeCompanion 的 actions |

