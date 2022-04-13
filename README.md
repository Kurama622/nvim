<h2 style="text-align: center;">  Neovim lua 配置 </h2>

<img alt="nvim-lua.png" src="https://gitee.com/svegeta/screenshot/raw/master/nvim-lua.png" width="90%" />
<img alt="nvim-debug.png" src="https://gitee.com/svegeta/screenshot/raw/master/nvim-debug.png" width="90%" />

<!-- TOC -->

* [依赖](#依赖)
* [编辑器操作](#编辑器操作)
	- [基本操作](#基本操作)
        + [光标移动及编辑器的保存与退出](#光标移动及编辑器的保存与退出)
        + [窗口操作](#窗口操作)
        + [文本操作](#文本操作)
            * [自动补全括号（引号） nvim-autopairs](#自动补全括号引号-nvim-autopairs)
            * [插入/更改括号（引号） surround.nvim](#插入更改括号引号-surroundnvim)
            * [自动注释 Comment.nvim](#自动注释-Commentnvim)
            * [常用快捷键](#常用快捷键)
    - [代码补全与语言服务协议（LSP）](#代码补全与语言服务协议lsp)
        + [nvim-cmp](#nvim-cmp)
        + [nvim-lspconfig](#nvim-lspconfig)
        + [nvim-lightbulb (for code action)](#nvim-lightbulb-for-code-action)
        + [常用快捷键](#常用快捷键)
    - [代码调试与运行](#代码调试与运行)
        + [调试器 nvim-dap](#调试器-nvim-dap)
        + [调试器UI nvim-dap-ui](#调试器ui-nvim-dap-ui)
        + [实时显示变量值 nvim-dap-virtual-text](#实时显示变量值-nvim-dap-virtual-text)
        + [常用快捷键](#常用快捷键)
    + [文件查找](#文件查找)
        + [telescope](#telescope)
        + [常用快捷键](#常用快捷键)
    - [其他](#其他)
        + [markdown-preview.nvim](#markdown-preview.nvim)
        + [vim-table-mode](#vim-table-mode)
    - [本配置文件的懒加载原则](#本配置文件的懒加载原则)
<!-- /TOC -->

## 依赖
- [ ] `pynvim` 
- [ ] `xclip` （`Linux`与`xorg`需要`xclip`来获取系统剪切板支持）
- [ ] 语言服务器客户端依赖
    - 如果你使用C++，你需要安装`clangd`
    - 如果你使用python，你需要安装`pyright`
    - 由于当前配置文件采用lua编写，建议安装`lua-language-server`
- [ ] [ripgrep](https://github.com/BurntSushi/ripgrep)（根据文本内容查找文件时会用到）


## 编辑器操作
### 基本操作
#### 光标移动及编辑器的保存与退出

移动方向键为默认的`h`、`j`、`k`、`l`

| 快捷键 | 行为               |
|--------|--------------------|
| `k`    | 将光标向上移动一行 |
| `j`    | 将光标向下移动一行 |
| `h`    | 将光标向左移动一格 |
| `l`    | 将光标向右移动一格 |
| `^`    | 到行首（含空格）   |
| `0`    | 到行首（不含空格） |
| `S`    | 保存               |
| `Q`    | 关闭当前窗口       |

#### 窗口操作

| 快捷键        | 行为                                   |
|---------------|----------------------------------------|
| `s` `k`       | 新建一个分屏并把它放置在当前窗口的上面 |
| `s` `j`       | 新建一个分屏并把它放置在当前窗口的下面 |
| `s` `h`       | 新建一个分屏并把它放置在当前窗口的左边 |
| `s` `l`       | 新建一个分屏并把它放置在当前窗口的右边 |
| `SPACE` + `h` | 移至左边的窗口                         |
| `SPACE` + `l` | 移至右边的窗口                         |
| `SPACE` + `k` | 移至上面的窗口                         |
| `SPACE` + `j` | 移至下面的窗口                         |
用方向键更改当前窗口的大小

#### 文本操作
##### 自动补全括号（引号） [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

##### 插入/更改括号（引号） [surround.nvim](https://github.com/ur4ltz/surround.nvim)

##### 自动注释 [Comment.nvim](https://github.com/numToStr/Comment.nvim)
<!-- [![numToStr/Comment.nvim](https://user-images.githubusercontent.com/42532967/136532939-926a8350-84b7-4e78-b045-fe21b5947388.gif)](https://github.com/numToStr/Comment.nvim) -->

[<img alt="numToStr/Comment.nvim"  src="https://user-images.githubusercontent.com/42532967/136532939-926a8350-84b7-4e78-b045-fe21b5947388.gif" width=60% />](https://github.com/numToStr/Comment.nvim)

##### 常用快捷键
| 快捷键                  | 行为                             |
|-------------------------|----------------------------------|
| `+y`                    | 复制选中文本至**系统剪切板**     |
| `+p`                    | 粘贴**系统剪切板**中的文本       |
| `SPACE` `SPACE`         | 删除下一个 `<++>` 并进入插入模式 |
| `c` `s` `<from>` `<to>` | 将`<from>`改为`<to>`             |
| `[visual]` `s` `<char>` | 在选中的文本两侧加入字符`<char>` |
| `d` `s` `<char>`        | 删除成对的`<char>`               |
| `g` `c` `c`             | 注释当前行                       |
| `g` `b` `c`             | 注释当前行（采用块注释）         |
| `[visual]` `g` `c`      | 注释选中行                       |
| `[visual]` `g` `b`      | 注释选中行（采用块注释）         |

### 代码补全与语言服务器协议（LSP）
#### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
#### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
#### [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) (for code action)

[<img alt="kosayoda/nvim-lightbulb"  src="https://camo.githubusercontent.com/6e4fcb68692c1e7bb359299dc0c167f186dfcb5765128fcb6511e93af3dad809/68747470733a2f2f73322e67696679752e636f6d2f696d616765732f6e76696d2d6c6967687462756c622e676966" width=60% />](https://github.com/kosayoda/nvim-lightbulb)

#### 常用快捷键
| 快捷键           | 行为                         |
|------------------|------------------------------|
| `CTRL` + `SPACE` | 显示补全                     |
| `CTRL` + `e`     | 关闭补全                     |
| `CENTER`         | 确定补全                     |
| `TAB`            | 下一个候选词                 |
| `SHIFT` + `TAB`  | 上一个候选词                 |
| `SPACE` + `d`    | 将候选词的帮助文档向下翻页   |
| `SPACE` + `u`    | 将候选词的帮助文档向上翻页   |
| `g` `d`          | 跳转到定义                   |
| `g` `D`          | 跳转到声明                   |
| `g` `r`          | 列出所有使用当前变量的行     |
| `K`              | 展开光标处关键词的帮助文档   |
| `SPACE` `r` `n`  | 变量重命名                   |
| `SPACE` `c` `a`  | code action                  |
| `SPACE` + `s`    | 显示当前行的语法检查信息     |
| `SPACE` + `e`    | 显示所有的语法检查信息       |
| `SPACE` + `-`    | 跳转到上一个语法有问题的地方 |
| `SPACE` + `=`    | 跳转到下一个语法有问题的地方 |


### 代码调试与运行

#### 调试器 [nvim-dap](https://github.com/mfussenegger/nvim-dap)

#### 调试UI [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
<!-- [![nvim-dap-ui](https://user-images.githubusercontent.com/24252670/126842672-de9c6b78-eec2-4187-b48e-977686ec4080.png)](https://github.com/rcarriga/nvim-dap-ui) -->
[<img alt="nvim-dap-ui" src="https://user-images.githubusercontent.com/24252670/126842672-de9c6b78-eec2-4187-b48e-977686ec4080.png" width=60% />](https://github.com/rcarriga/nvim-dap-ui)

#### 实时显示变量值 [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
<!-- [![nvim-dap-virtual-text](https://user-images.githubusercontent.com/7189118/81495701-6b48f980-92b2-11ea-8df4-dd476dc825bc.gif)](https://github.com/theHamsta/nvim-dap-virtual-text) -->

[<img alt="nvim-dap-virtual-text" src="https://user-images.githubusercontent.com/7189118/81495701-6b48f980-92b2-11ea-8df4-dd476dc825bc.gif" width=60% />](https://github.com/theHamsta/nvim-dap-virtual-text)

#### 常用快捷键
| 快捷键            | 行为                   |
|-------------------|------------------------|
| `SPACE` + `t`     | 开启终端               |
| `<F5>`            | 运行程序               |
| `<F10>`           | 开始调试               |
| `<F4>`            | 停止调试               |
| `<F2>`            | 继续调试               |
| `<F6>`            | 步进                   |
| `<F7>`            | 跳进                   |
| `<F8>`            | 跳出                   |
| `<SPACE>` + `p`   | 打印当前光标处的变量值 |
| `<SPACE>` `d` `b` | 打断点                 |
| `<SPACE>` `d` `B` | 打条件断点             |
| `<SPACE>` `d` `r` | 调出repl窗口           |
| `<SPACE>` `d` `l` | 重新运行上次的调试器   |

### 文件查找
#### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

<img alt="telescope" src="https://camo.githubusercontent.com/3d59e34d1f406890adf620546d3d97017ce0aacda034b1788c66fa872f192134/68747470733a2f2f692e696d6775722e636f6d2f5454546a6136742e676966" width=60% />

#### 常用快捷键

| 快捷键       | 行为                 |
|--------------|----------------------|
| `CTRL` + `f` | 查找文件             |
| `CTRL` + `b` | 查找缓冲区（buffer） |
| `CTRL` + `l` | 查找文本             |
| `CTRL` + `h` | 查找历史文件         |
| `ALT` + `h`  | 查找帮助命令         |
| `CTRL` + `j` | 选择下一个文件       |
| `CTRL` + `k` | 选择上一个文件       |
| `CTRL` + `u` | 预览区往前翻页       |
| `CTRL` + `f` | 预览区往后翻页       |

### 其他

#### [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

<img alt="markdown-preview.nvim" src="https://user-images.githubusercontent.com/5492542/47603494-28e90000-da1f-11e8-9079-30646e551e7a.gif" width=60% />

按下`<F5>`即可开启预览
#### [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)

`SPACE` `t` `m`开启表格对齐

### 本配置文件的懒加载原则

- 对于表格对齐、markdown预览等特殊用途的插件，在调用时加载。

- LSP会根据不同的语言类型选择对应的服务器进行加载，但LSP的配置会在neovim初始化完成之后进行加载，因为我们打开一个程序，肯定是需要语法检查功能的，谁也不想自己观摩了半天的程序，是个错误的范例。

- 对于`treesitter`（语法高亮增强）、状态栏、`indent-blankline`（显示缩进线）、`LuaSnip`（代码片段）、代码补全在进入插入模式时加载。因为代码片段和代码补全几乎只有在插入模式下才能用得到，而语法高亮增强等则不太重要，如果我打开一个文件，直到退出也没有进入插入模式，那这个文件多半我只是看一看，这时候只需要为我提供简单的语法高亮即可。

- 对于调试的插件，会在neovim初始化完成之后进行加载。之所以不在插入模式下加载，主要是因为对于一个文件，即使我们不对它进行编辑，也可能会有对它调试的需求。
