--  ==================================================
-- to fix the error with autopairs + cmp
local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)
--  ==================================================

local npairs_status_ok, npairs = pcall(require, "nvim-autopairs")
if not npairs_status_ok then
  return
end

local Rule_status_ok, Rule = pcall(require, "nvim-autopairs.rule")
if not Rule_status_ok then
  return
end

npairs.setup({
  check_tx = true,
  ts_config = {
    lua = {'string'}, -- don't add pair on this treesitter node  ? string node??
    javascript = {'template_string'},
    --java = false, -- don't check treesitter on java
  },
  --enable_check_bracket_line = false,
})

local ts_conds_status_ok, ts_conds = pcall(require, "nvim-autopairs.ts-conds")
if not ts_conds_status_ok then
  return
end

npairs.add_rules({
  Rule("%", "%","lua")
    :with_pair(ts_cond.is_ts_node({'string', 'comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'})),
})
