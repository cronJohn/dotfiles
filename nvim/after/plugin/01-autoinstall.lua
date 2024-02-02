local packages_to_install = {
    "codelldb",
}

require("mason").setup()

local function install_package(package)
    vim.cmd("MasonInstall " .. package)
end

local function is_installed(package)
    return vim.fn.executable(package) == 1
end

for _, package in ipairs(packages_to_install) do
    if not is_installed(package) then
        install_package(package)
    end
end
