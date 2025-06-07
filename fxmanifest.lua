-- よくわからん（Fxサーバーの何かしら笑）
fx_version 'cerulean'
-- 利用できるゲーム
game 'gta5'
-- 開発者
author 'DOGON <dogon309.dev@gmail.com>'
-- 説明
description 'フレームワークのコア'
version '0.1.0'

-- クライアントに読み込まれるファイル
client_scripts {
    'client/*',
}

-- サーバーに読み込まれるファイル
server_scripts {
    'server/*',
}

ui_page 'ui/index.html'

-- クライアント側がダウンロードするファイル
files {
    'ui/index.html',
}

-- このリソースを読み込む前に読み込むリソース
dependency 'oxmysql'

-- Lua5.4を有効にします
lua54 'yes'
