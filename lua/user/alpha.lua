local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
[[      ............                    ...                      ..........      ]],
[[   ',;:lc;;:lolc::::::;;,..        .:llooool:.         .',:c:;::::cc::lo:;clc. ]],
[[ .lc''::. .cl'....':lcodkOxdl;.    cKo'. .'cl.    .,;::cool;,'''',,'..cl..;cl:.]],
[[ ;o;,;::,..';;'.;ccc:,:oxkxkKXKOo:.:0kdl,;c;..,clooolc:::,.':cldo,.. .oOookx:. ]],
[[  .',:lcc:,'cl..,clc,';cll:lxO0OolxKXOo;.',;lddlcooldo:;:cll:cc::'..'oOKNkc,.  ]],
[[     ..:occccc..cdc::colccc:;,'..:xd,.,'  ,c;',,.'';odoollldkOx,..;xXKd:,.     ]],
[[        'odol:clo;.;oxo:,..      .dO::x:.:x:. ...  ....:dOdclc..;dXNKd,        ]],
[[          ':;,;' .,cxo:;.        .dXc.'...'.           ;KKocl:'',;:;.          ]],
[[                'cl:,ckd'         lO;.....'.           ,kl.'d0x,               ]],
[[               .xk::col.          :x,.'. ...           ld..;xXO;               ]],
[[                :kkdlc,  .        ;x,.'. .'.  .       .xl .dNKc.               ]],
[[                 .:dxoc,;:,'.     'x: ..     ...    .,dKk:ldc.                 ]],
[[                    ',.......      od...            ';'''..                    ]],
[[                                   .dc...                                      ]],
[[                                    ;x;                                        ]],
[[                                     :d,                                       ]],
[[                                      ,;.                                      ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/AppData/Local/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}


dashboard.section.footer.val = "alan-nvim"
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
