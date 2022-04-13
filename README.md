<h2 style="text-align: center;">  Neovim lua 配置 </h2>

<img alt="nvim-lua.png" src="https://gitee.com/svegeta/screenshot/raw/master/nvim-lua.png" width="90%" />
<img alt="nvim-debug.png" src="https://gitee.com/svegeta/screenshot/raw/master/nvim-debug.png" width="90%" />

<!-- TOC -->

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

#### 代码补全与语言服务器协议（LSP）
##### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
##### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
##### [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) (for code action)

[<img alt="kosayoda/nvim-lightbulb"  src="https://camo.githubusercontent.com/6e4fcb68692c1e7bb359299dc0c167f186dfcb5765128fcb6511e93af3dad809/68747470733a2f2f73322e67696679752e636f6d2f696d616765732f6e76696d2d6c6967687462756c622e676966" width=60% />](https://github.com/kosayoda/nvim-lightbulb)

##### 常用快捷键
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


#### 代码调试与运行

##### 调试器 [nvim-dap](https://github.com/mfussenegger/nvim-dap)

##### 调试UI [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
<!-- [![nvim-dap-ui](https://user-images.githubusercontent.com/24252670/126842672-de9c6b78-eec2-4187-b48e-977686ec4080.png)](https://github.com/rcarriga/nvim-dap-ui) -->
[<img alt="nvim-dap-ui" src="https://user-images.githubusercontent.com/24252670/126842672-de9c6b78-eec2-4187-b48e-977686ec4080.png" width=60% />](https://github.com/rcarriga/nvim-dap-ui)

##### 时实显示变量值 [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
<!-- [![nvim-dap-virtual-text](https://user-images.githubusercontent.com/7189118/81495701-6b48f980-92b2-11ea-8df4-dd476dc825bc.gif)](https://github.com/theHamsta/nvim-dap-virtual-text) -->

[<img alt="nvim-dap-virtual-text" src="https://user-images.githubusercontent.com/7189118/81495701-6b48f980-92b2-11ea-8df4-dd476dc825bc.gif" width=60% />](https://github.com/theHamsta/nvim-dap-virtual-text)

##### 常用快捷键
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

