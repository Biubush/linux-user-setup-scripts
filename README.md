## 简介

一个用于配置用户初始化脚本的库，实际功能就是在Debian/Ubuntu（其他发行版自行测试）下，创建新用户时，自动为用户配置终端环境

有以下两个版本：

1. user-setup-zsh.sh
2. user-setup-zsh-conda.sh

## user-setup-zsh

只在创建用户时为其配置好zsh环境，安装oh-my-zsh

具体环境为：

主题：powerlevel10k

插件1：zsh-autosuggestions 是一个命令提示插件，当你输入命令时，会自动推测你可能需要输入的命令，按下右键可以快速采用建议。

插件2：zsh-syntax-highlighting 是一个命令语法校验插件，在输入命令的过程中，若指令不合法，则指令显示为红色，若指令合法就会显示为绿色。

一行命令即可配置：


```bash
curl -fsSL https://raw.githubusercontent.com/Biubush/linux-user-setup-scripts/master/user-setup-zsh.sh | sudo bash
```

成功执行后，可以使用adduser添加用户，新建用户登录时会自动配置好zsh环境

用户成功登录后可能需要输入密码以进行初始化

## user-setup-zsh-conda

在创建用户时为其配置好zsh环境及conda环境

具体环境为：

zsh环境与上一个脚本一致

conda环境使用Miniconda3-py39_24.9.2-0-Linux-x86_64版本

会自动绑定conda到zsh上，且conda源已替换为清华源

一行命令即可配置：

```bash
curl -fsSL https://raw.githubusercontent.com/Biubush/linux-user-setup-scripts/master/user-setup-zsh-conda.sh | sudo bash
```