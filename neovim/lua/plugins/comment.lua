local cmnt = require('Comment')


cmnt.setup({
  pre_hook = function(ctx)
    local cmnt_utils = require('Comment.utils')
    local type = ctx.ctype == cmnt_utils.ctype.line and '__default' or '__multiline'

    local location

    if ctx.ctype == cmnt_utils.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == cmnt_utils.cmotion.v or ctx.cmoition == cmnt_utils.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring({
      key = type,
      location = location
    })
  end
})
