#!/bin/zsh

APP_MODULE_DIR="./../app/src/main/java/com/ftani/multimodulegradlesample/domain"
DOMAIN_MODULE_DIR="./../domain/src/main/java/com/ftani/domain"

# 指定したディレクトリからサブディレクトリも含めた全ファイル数を取得する1
APP_MODULE_FILE_COUNT=(`ls -UFR $APP_MODULE_DIR | grep -v "/\|.:\|^\s*$" | wc -l`)
echo "$APP_MODULE_FILE_COUNT"

# 指定したディレクトリからサブディレクトリも含めた全ファイル数を取得する1
DOMAIN_MODULE_FILE_COUNT=(`ls -UFR $DOMAIN_MODULE_DIR | grep -v "/\|.:\|^\s*$" | wc -l`)
echo "$DOMAIN_MODULE_FILE_COUNT"

# 割合を出すために取得した全ファイル数を足しておく
ALL=$((APP_MODULE_FILE_COUNT+DOMAIN_MODULE_FILE_COUNT))
echo "$ALL"

# 割合計算を行い小数点5桁分表示する。
PARCENT=(`echo "scale=5; ${DOMAIN_MODULE_FILE_COUNT}/${ALL}*100" | bc | xargs printf "%.2f\n"`)

echo "$PARCENT"
