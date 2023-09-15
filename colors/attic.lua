for k in pairs(package.loaded) do
    if k:match(".*attic.*") then package.loaded[k] = nil end
end

require('attic').setup()
require('attic').colorscheme()
