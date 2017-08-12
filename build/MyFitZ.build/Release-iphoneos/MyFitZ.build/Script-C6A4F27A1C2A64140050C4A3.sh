#!/bin/sh
echo "$CODESIGNING_FOLDER_PATH" >/tmp/"$USER.ident" && echo "$CODE_SIGN_IDENTITY" >>/tmp/"$USER.ident" && exit;

