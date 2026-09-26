# dwm 快捷键

`MODKEY = Mod4Mask`（Super / Windows 键）

## 键盘

### 启动 / 系统

| 快捷键 | 作用 |
|---|---|
| `Super + z` | 弹 dmenu 程序启动器（底部） |
| `Super + Shift + Enter` | 开终端 st |
| `Super + Shift + r` | 录屏开关（gsr-toggle.sh 脚本） |
| `Super + Shift + m` | 退出 dwm（quit） |

### 窗口焦点 / 排列

| 快捷键 | 作用 |
|---|---|
| `Super + j` | 焦点移向下一个窗口 |
| `Super + k` | 焦点移向上一个窗口 |
| `Super + Return` | zoom：当前窗口与主窗口交换 |
| `Super + i` | 增加主区域窗口数（nmaster +1） |
| `Super + d` | 减少主区域窗口数（nmaster −1） |
| `Super + h` | 主区域变窄（mfact −0.05） |
| `Super + l` | 主区域变宽（mfact +0.05） |
| `Super + Shift + q` | 关闭当前窗口 |

### 布局

| 快捷键 | 作用 |
|---|---|
| `Super + t` | 平铺布局 `[]=` |
| `Super + f` | 浮动布局 `><>` |
| `Super + m` | 单窗口最大化布局 `[M]` |
| `Super + Space` | 循环切换布局 |
| `Super + Shift + Space` | 当前窗口浮动/平铺切换 |
| `Super + Shift + f` | 全屏切换（togglefullscreen） |

### 标签（工作区）

| 快捷键 | 作用 |
|---|---|
| `Super + 1..9` | 切换到标签 1..9 |
| `Super + Ctrl + 1..9` | 切换该标签是否可见（toggleview） |
| `Super + Shift + 1..9` | 把当前窗口移到标签 1..9 |
| `Super + Ctrl + Shift + 1..9` | 在标签上增删当前窗口 |
| `Super + 0` | 查看所有标签 |
| `Super + Shift + 0` | 把当前窗口移到所有标签 |
| `Super + Tab` | 回到上一个标签 |

> 注意：`tags[]` 只定义了 "1" "2" "3" 三个名字，但 TAGKEYS 绑到了 1–9，所以 4–9 是无名字标签，能用但状态栏不显示名字。

### 多显示器

| 快捷键 | 作用 |
|---|---|
| `Super + ,` / `Super + .` | 焦点移到上/下一个显示器 |
| `Super + Shift + ,` / `Super + Shift + .` | 把窗口移到上/下一个显示器 |

### 间距 / 状态栏

| 快捷键 | 作用 |
|---|---|
| `Super + -` | 减小窗口间距 |
| `Super + =` | 增大窗口间距 |
| `Super + Shift + =` | 重置间距为默认 |
| `Super + b` | 显示/隐藏状态栏 |

### 多媒体（无修饰键，全局热键）

| 快捷键 | 作用 |
|---|---|
| `F2` | 音量 −5% |
| `F3` | 音量 +5% |
| `F5` | 亮度 −5% |
| `F6` | 亮度 +5% |

## 鼠标

| 操作 | 作用 |
|---|---|
| 左键点布局符号 | 循环布局 |
| 右键点布局符号 | 切到 monocle |
| 中键点窗口标题 | zoom（提到主区域） |
| 中键点状态栏文字 | 开终端 st |
| `Super + 左键拖动` 窗口 | 移动窗口 |
| `Super + 中键` 点窗口 | 浮动/平铺切换 |
| `Super + 右键拖动` 窗口 | 调整窗口大小 |
| 左键/右键点标签栏 | 切换 / 切换可见性 |
| `Super + 左键/右键` 点标签栏 | 把窗口移到 / 增删该标签 |

## 备注

- `Super + f` 是浮动布局，`Super + Shift + f` 才是全屏，别搞混。
- 配置来源：`~/dwm/config.def.h`（`make` 时生成 `config.h`）。
