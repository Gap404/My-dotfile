# --- 输入法环境变量（必须在启动任何 X 客户端之前设置）---
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# --- 输入法 ---
fcitx5 &

# --- 其他 ---
picom &
( sleep 3; exec dwmblocks ) &
feh --bg-fill /home/arch/Pictures/walls-catppuccin-mocha/basement.jpg


exec dwm
