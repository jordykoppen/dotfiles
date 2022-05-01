-- local user_config_dir = get_config_dir()

local function apply_defaults(configs, defaults)
  configs = configs or {}
  return vim.tbl_deep_extend("keep", configs, defaults)
end
