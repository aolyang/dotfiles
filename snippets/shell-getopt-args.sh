#!/usr/bin/env bash

# 注意，getopt 的 xxx.sh -a a-arg 中的a-arg不会成为 -a的value
# 单冒号(:)接必选参数，双冒号可选参数
# 定义用法，-a不需要参数，-b参数是必须的，-c的参数可选
usage() {
  echo "Usage: $0 [-a] [-b arg] [-c [arg]] [--a-long] [--b-long arg] [--c-long [arg]]"
  exit 1
}

ARGS=`getopt -o ab:c:: --long a-long,b-long:,c-long:: -n "$0" -- "$@"`
if [ $? != 0 ]; then
  echo "Terminating..."
  exit 1
fi
if [ $# == 0 ]; then
  usage
fi

# 用eval set -- 将解析后的参数赋值给位置参数
eval set -- "$ARGS"

# 用while循环和case语句处理不同的选项
while true; do
  case "$1" in
    -a)
      echo "Option a"
      shift
      ;;
    -b)
      echo "Option b, argument $2"
      shift 2
      ;;
    -c)
      case "$2" in
        "")
          echo "Option c, no argument"
          shift 2
          ;;
        *)
          echo "Option c, argument $2"
          shift 2
          ;;
      esac
      ;;
    --a-long)
        echo "Option a-long"
        shift
        ;;
    --b-long)
        echo "Option b-long, argument $2"
        shift 2
        ;;
    --c-long)
        case "$2" in
          "")
            echo "Option c-long, no argument"
            shift 2
            ;;
          *)
            echo "Option c-long, argument $2"
            shift 2
            ;;
        esac
        ;;
    --)
      shift
      break
      ;;
    *)
      echo "Internal error!"
      exit 1
      ;;
  esac
done

# 处理剩余的参数
for arg in "$@"; do
  echo "Processing $arg"
done
