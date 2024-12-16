#!/bin/bash

# 检查是否以sudo权限运行
if [ "$EUID" -ne 0 ]; then
  echo "请使用sudo权限运行此脚本。"
  exit 1
fi

# 定义文件和目标路径
OH_MY_ZSH_RC_URL="https://pan.biubush.cn/d/download/amd64/oh-my-zsh-pkg.tar.gz"
OH_MY_ZSH_RC_DEST="/home/share"

SETUP_SCRIPT_URL="https://pan.biubush.cn/d/download/amd64/setup-oh-my-zsh.sh"
SETUP_SCRIPT_DEST="/etc/profile.d"

# 下载oh-my-zsh-rc.tar.gz
if [ ! -d "$OH_MY_ZSH_RC_DEST" ]; then
  echo "目标文件夹$OH_MY_ZSH_RC_DEST不存在，正在创建..."
  mkdir -p "$OH_MY_ZSH_RC_DEST"
  echo "已成功创建文件夹：$OH_MY_ZSH_RC_DEST"
fi

echo "正在下载oh-my-zsh-rc.tar.gz到$OH_MY_ZSH_RC_DEST..."
curl -fSL "$OH_MY_ZSH_RC_URL" -o "$OH_MY_ZSH_RC_DEST/oh-my-zsh-rc.tar.gz"
if [ $? -eq 0 ]; then
  echo "oh-my-zsh-rc.tar.gz下载成功。"
  chmod 644 "$OH_MY_ZSH_RC_DEST/oh-my-zsh-rc.tar.gz"
  echo "已赋予文件644权限。"
else
  echo "oh-my-zsh-rc.tar.gz下载失败，请检查网络连接或URL。"
  exit 1
fi

# 下载setup-oh-my-zsh.sh
if [ ! -d "$SETUP_SCRIPT_DEST" ]; then
  echo "目标文件夹$SETUP_SCRIPT_DEST不存在，正在创建..."
  mkdir -p "$SETUP_SCRIPT_DEST"
  echo "已成功创建文件夹：$SETUP_SCRIPT_DEST"
fi

echo "正在下载setup-oh-my-zsh.sh到$SETUP_SCRIPT_DEST..."
curl -fSL "$SETUP_SCRIPT_URL" -o "$SETUP_SCRIPT_DEST/setup-oh-my-zsh.sh"
if [ $? -eq 0 ]; then
  echo "setup-oh-my-zsh.sh下载成功。"
  chmod 755 "$SETUP_SCRIPT_DEST/setup-oh-my-zsh.sh"
  echo "已赋予文件755权限。"
else
  echo "setup-oh-my-zsh.sh下载失败，请检查网络连接或URL。"
  exit 1
fi

# 提示用户操作完成
echo "所有任务已成功完成。"
echo "oh-my-zsh-rc.tar.gz已下载到$OH_MY_ZSH_RC_DEST并赋予权限。"
echo "setup-oh-my-zsh.sh已下载到$SETUP_SCRIPT_DEST并赋予权限。"

