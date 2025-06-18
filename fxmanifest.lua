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
    'server/*',
    'server/constant/*',
    'server/db/*',
    'server/models/*',
    'server/lib/*',
    'server/event/*'
}

ui_page 'ui/index.html'

-- クライアント側がダウンロードするファイル
files {
    'ui/index.html',
    'ui/map.png',
    'ui/css/style.css',
    'ui/js/app.js',
    'ui/images/*.png'
}

-- このリソースを読み込む前に読み込むリソース
dependency 'oxmysql'

-- Lua5.4を有効にします
lua54 'yes'
