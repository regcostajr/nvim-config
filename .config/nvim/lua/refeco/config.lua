local function execute_term_cmd(cmd)
	vim.cmd("term " .. cmd)
end

local language_configs = {
	perl = {
		test_pattern = function(file_ext)
			return file_ext == "t"
		end,
		test_cmd = "prove -v %",
		run_cmd = "perl %",
		debug_cmd = "perl -d %",
	},
	go = {
		test_pattern = function(filename)
			return string.find(filename, "_test.go")
		end,
		test_cmd = "go test -v ./...",
		run_cmd = "go run %",
		debug_cmd = "dlv debug %",
	},
}

function Run()
	local filetype = vim.bo.filetype
	local config = language_configs[filetype]

	if not config then
		return
	end

	local filename = vim.fn.expand("%")
	if config.test_pattern(filename) then
		execute_term_cmd(config.test_cmd)
	else
		execute_term_cmd(config.run_cmd)
	end
end

function Debug()
	local filetype = vim.bo.filetype
	local config = language_configs[filetype]

	if not config or not config.debug_cmd then
		return
	end

	execute_term_cmd(config.debug_cmd)
end
