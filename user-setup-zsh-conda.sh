#!/bin/bash

# 检查是否以sudo权限运行
if [ "$EUID" -ne 0 ]; then
  echo "请使用sudo权限运行此脚本。"
  exit 1
fi

# 定义文件和目标路径
MINICONDA_URL="https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py39_24.9.2-0-Linux-x86_64.sh"
MINICONDA_DEST="/home/share"

OH_MY_ZSH_RC_URL="https://pan.biubush.cn/d/download/amd64/oh-my-zsh-pkg.tar.gz"
OH_MY_ZSH_RC_DEST="/home/share"

SETUP_SCRIPT_URL="https://pan.biubush.cn/d/download/amd64/setup-zsh-conda.sh"
SETUP_SCRIPT_DEST="/etc/profile.d"

# 下载Miniconda安装脚本
if [ ! -d "$MINICONDA_DEST" ]; then
  echo "目标文件夹$MINICONDA_DEST不存在，正在创建..."
  mkdir -p "$MINICONDA_DEST"
  echo "已成功创建文件夹：$MINICONDA_DEST"
fi

echo "正在下载Miniconda安装脚本到$MINICONDA_DEST..."
curl -fSL "$MINICONDA_URL" -o "$MINICONDA_DEST/Miniconda3-py39_24.9.2-0-Linux-x86_64.sh"
if [ $? -eq 0 ]; then
  echo "Miniconda安装脚本下载成功。"
  chmod 644 "$MINICONDA_DEST/Miniconda3-py39_24.9.2-0-Linux-x86_64.sh"
  echo "已赋予文件644权限。"
else
  echo "Miniconda安装脚本下载失败，请检查网络连接或URL。"
  exit 1
fi

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

# 下载setup-zsh-conda.sh
if [ ! -d "$SETUP_SCRIPT_DEST" ]; then
  echo "目标文件夹$SETUP_SCRIPT_DEST不存在，正在创建..."
  mkdir -p "$SETUP_SCRIPT_DEST"
  echo "已成功创建文件夹：$SETUP_SCRIPT_DEST"
fi

echo "正在下载setup-zsh-conda.sh到$SETUP_SCRIPT_DEST..."
curl -fSL "$SETUP_SCRIPT_URL" -o "$SETUP_SCRIPT_DEST/setup-zsh-conda.sh"
if [ $? -eq 0 ]; then
  echo "setup-zsh-conda.sh下载成功。"
  chmod 755 "$SETUP_SCRIPT_DEST/setup-zsh-conda.sh"
  echo "已赋予文件755权限。"
else
  echo "setup-zsh-conda.sh下载失败，请检查网络连接或URL。"
  exit 1
fi

# 提示用户操作完成
echo "所有任务已成功完成。"
echo "Miniconda安装脚本已下载到$MINICONDA_DEST并赋予权限。"
echo "oh-my-zsh-rc.tar.gz已下载到$OH_MY_ZSH_RC_DEST并赋予权限。"
echo "setup-zsh-conda.sh已下载到$SETUP_SCRIPT_DEST并赋予权限。"

