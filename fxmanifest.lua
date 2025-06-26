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
    'config.lua',
    'client/*.lua'
}

-- サーバーに読み込まれるファイル
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/constant/*.lua',
    'server/models/*.lua',
    'server/db/*.lua',
    'server/*.lua',
    'server/event/*.lua'
}

ui_page 'client/ui/index.html'

-- クライアント側がダウンロードするファイル
files {
    'client/ui/index.html',
    'client/ui/css/style.css',
    'client/ui/js/app.js',
    'client/ui/images/*.png'
}

-- このリソースを読み込む前に読み込むリソース
dependency 'oxmysql'

-- Lua5.4を有効にします
lua54 'yes'
