local M = {
    "mfussenegger/nvim-dap",

    dependencies = {
        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup({
                    commented = true,
                    highlight_changed_variables = true,
                })
            end,
        },
        { "jbyuki/one-small-step-for-vimkind" },
    },
}
function M.init()
    vim.keymap.set("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
    end, { desc = "Toggle Breakpoint" })

    vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
    end, { desc = "Continue" })

    vim.keymap.set("n", "<leader>dt", function()
        require("dap").terminate()
    end, { desc = "Terminate" })

    vim.keymap.set("n", "<leader>do", function()
        require("dap").step_over()
    end, { desc = "Step Over" })

    vim.keymap.set("n", "<leader>di", function()
        require("dap").step_into()
    end, { desc = "Step Into" })

    vim.keymap.set("n", "<leader>dw", function()
        require("dap.ui.widgets").hover()
    end, { desc = "Widgets" })

    vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.open()
    end, { desc = "Repl" })

    vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "TSAttribute", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "TSNumber", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogpoint", { text = "L", texthl = "TSFunction", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "TSConstant", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "➜", texthl = "", linehl = "Normal", numhl = "" })
end

function M.config()
    local dap = require("dap")
    dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/home/tobias/.cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }
    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopAtEntry = true,
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description = "enable pretty printing",
                    ignoreFailures = false
                },
            },
        },
        {
            name = "Attach to gdb",
            type = "cppdbg",
            request = "launch",
            MIMode = "gdb",
            --miDebuggerServerAddress = "localhost:1234",
            miDebuggerPath = "/usr/bin/gdb",
            cwd = "${workspaceFolder}",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
        },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

return M
