## <center> Nvim hua 配置 </center>

<img alt="nvim-lua.png" src="https://gitee.com/svegeta/screenshot/raw/master/nvim-lua.png" width="60%" />
<img alt="nvim-debug.png" src="https://gitee.com/svegeta/screenshot/raw/master/nvim-debug.png" width="60%" />

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
[![numToStr/Comment.nvim](https://user-images.githubusercontent.com/42532967/136532939-926a8350-84b7-4e78-b045-fe21b5947388.gif)](https://github.com/numToStr/Comment.nvim)

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
| `[visual]` `g` `b`     | 注释选中行（采用块注释）          |

#### 代码补全与语言服务器协议（LSP）
- 


#### 代码调试与运行

##### 调试器 [nvim-dap](https://github.com/mfussenegger/nvim-dap)

##### 调试UI [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
[![nvim-dap-ui](https://user-images.githubusercontent.com/24252670/126842672-de9c6b78-eec2-4187-b48e-977686ec4080.png)](https://github.com/rcarriga/nvim-dap-ui)

##### 时实显示变量值 [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
[![nvim-dap-virtual-text](https://user-images.githubusercontent.com/7189118/81495701-6b48f980-92b2-11ea-8df4-dd476dc825bc.gif)](https://github.com/theHamsta/nvim-dap-virtual-text)


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

### 

<!--
### 3 标签页管理
| 快捷键      | 行为                     |
|-------------|--------------------------|
| `t` `u`     | 新建一个标签页           |
| `t` `n`     | 移至左侧标签页           |
| `t` `i`     | 移至右侧标签页           |
| `t` `m` `n` | 将当前标签页向左移动一格 |
| `t` `m` `i` | 将当前标签页向右移动一格 |

### 4 终端键盘快捷键
| 快捷键     | 行为             |
|------------|------------------|
| `Ctrl` `n` | 退出终端输入模式 |

## 插件快捷键 (截图/动图已经准备好！)
### 自动补全
#### [COC (自动补全)](https://github.com/neoclide/coc.nvim)
| 快捷键          | 行为               |
|-----------------|--------------------|
| `Space` `y`     | **打开剪切板历史** |
| `gd`            | 列出定义列表       |
| `gr`            | 列出参考列表       |
| `gi`            | 待办事项清单       |
| `gy`            | 转至类型定义       |
| `Space` `r` `n` | 重命名变量         |

<img alt="Gif" src="https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif" width="60%" />

#### [Ultisnips](https://github.com/SirVer/ultisnips)
| 快捷键     | 行为                     |
|------------|--------------------------|
| `Ctrl` `e` | 召唤一个代码片段         |
| `Ctrl` `n` | 在一个代码片段中前移光标 |
| `Ctrl` `e` | 在一个代码片段中后移光标 |

![GIF Demo](https://raw.github.com/SirVer/ultisnips/master/doc/demo.gif)



### 文字编辑
#### [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
| 快捷键          | 行为         |
|-----------------|--------------|
| `SPACE` `t` `m` | 开关表格模式 |
| `SPACE` `t` `r` | 重组表格     |

See `:help table-mode.txt` for more.

#### [vim-markdown-toc (为 Markdown 文件生成目录)](https://github.com/mzlogin/vim-markdown-toc)
在 `Markdown` 文件中, 按下 `:Gen` 打开菜单，你将会看到可选选项

<img alt="Gif" src="https://raw.githubusercontent.com/mzlogin/vim-markdown-toc/master/screenshots/english.gif" width="60%" />

### 缓冲区内导航
#### [vim-easy-motion](https://github.com/easymotion/vim-easymotion)
按 `'` 键和一个 `字母` 跳转至 `字母` (类似 Emacs 的 [AceJump](https://www.emacswiki.org/emacs/AceJump))

<img alt="Gif" src="https://f.cloud.github.com/assets/3797062/2039359/a8e938d6-899f-11e3-8789-60025ea83656.gif" width="60%" />

### 查找与替换
#### [Far.vim - 查找与替换](https://github.com/brooth/far.vim)
按下 `SPACE` `f` `r` 在工作目录中搜索

<img alt="Gif" src="https://cloud.githubusercontent.com/assets/9823254/20861878/77dd1882-b9b4-11e6-9b48-8bc60f3d7ec0.gif" width="60%" />


### 其它

<img alt="Png" src="https://raw.github.com/junegunn/i/master/goyo.png" width="60%" />

#### [coc-translator](https://github.com/voldikss/coc-translator)
按下 `ts` 来 **翻译光标所在的单词**.

<img alt="Png" src="https://user-images.githubusercontent.com/20282795/72232547-b56be800-35fc-11ea-980a-3402fea13ec1.png" width="60%" />
-->
