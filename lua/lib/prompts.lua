local prompts = {
    docs = 'Generate comprehensive documentation for this code including parameters, return values, and usage examples.',
    explain = 'Explain this code in detail, including its purpose, logic flow, and any algorithms used.',
    fix = 'Identify and fix any bugs, errors, or code smells in this code.',
    commit = 'Create a descriptive commit message following conventional commits format for these changes.',
    optimize = 'Optimize this code for better performance, readability, and maintainability.',
    review = 'Review this code for best practices, potential issues, and suggest improvements.',
    tests = 'Write comprehensive unit tests covering all edge cases for this code.',
}

---Returns a function that inserts the named prompt at cursor position
---@param prompt_name string Name of the prompt to insert
---@return function Function to execute in a keybinding
prompts.add_prompt = function(prompt_name)
    local prompt_text = prompts[prompt_name]
    return function()
        vim.cmd("put ='" .. prompt_text:gsub("'", "''") .. "'")
    end
end

return prompts
