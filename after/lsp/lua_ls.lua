-- lua_ls configuration that tells lua lsp 'vim' is a defined global

return
{
    settings =
    {
        Lua =
        {
            diagnostics =
            {
                globals = { 'vim' }
            }
        }
    }
}
