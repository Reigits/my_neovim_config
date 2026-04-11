return {
    -- this is custom config to fix the vim being detected as undefined global variable
    settings = {
        lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
}
