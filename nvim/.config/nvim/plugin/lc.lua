local function strip_query(url)
	-- cut at the first ? or #, whichever comes first
	return url:match("^[^%?#]+") or url
end

-- Extensible table: match a URL against `pattern` (a Lua pattern),
-- and if it matches, build the shell command to run.
-- Add new entries here for future sites.
local URL_HANDLERS = {
	{
		pattern = "leetcode%.com",
		build_cmd = function(url)
			return string.format("lc %s cpp", vim.fn.shellescape(url))
		end,
	},
	{
		pattern = "neetcode%.io",
		build_cmd = function(url)
			return string.format("ncfile %s cpp", vim.fn.shellescape(url))
		end,
	},
}

local function get_cmd_for_url(url)
	for _, handler in ipairs(URL_HANDLERS) do
		if url:find(handler.pattern) then
			return handler.build_cmd(url)
		end
	end
	return nil
end

local function lc_new_file(name)
	if not name or name == "" then
		vim.notify("LcNewFile: missing argument", vim.log.levels.ERROR)
		return
	end

	name = strip_query(name)

	local cmd = get_cmd_for_url(name)
	if not cmd then
		vim.notify("LcNewFile: no handler for URL: " .. name, vim.log.levels.ERROR)
		return
	end

	local ok_oil, oil = pcall(require, "oil")
	local dir = (ok_oil and oil.get_current_dir()) or (vim.fn.getcwd() .. "/")

	local handle = io.popen(cmd)
	if not handle then
		vim.notify("LcNewFile: failed to run: " .. cmd, vim.log.levels.ERROR)
		return
	end
	local filename = handle:read("*l")
	handle:close()

	if not filename or filename == "" then
		vim.notify("LcNewFile: command produced no filename", vim.log.levels.ERROR)
		return
	end
	filename = filename:gsub("%s+$", "")

	local filepath = dir .. filename

	local f = io.open(filepath, "w")
	if not f then
		vim.notify("LcNewFile: could not create " .. filepath, vim.log.levels.ERROR)
		return
	end
	f:write(string.format("/*\n * %s\n*/\n", name))
	f:close()

	vim.cmd("edit " .. vim.fn.fnameescape(filepath))
end

vim.api.nvim_create_user_command("LcNewFile", function(opts)
	lc_new_file(opts.args)
end, { nargs = 1 })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function(args)
		vim.keymap.set("n", "<leader>lc", function()
			vim.ui.input({ prompt = "lc arg: " }, function(input)
				if input then
					lc_new_file(input)
				end
			end)
		end, { buffer = args.buf, desc = "Create new file via lc/ncfile" })
	end,
})
