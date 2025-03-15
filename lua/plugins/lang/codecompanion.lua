local CONTEXT_SIZES = {
    S = 8192,
    M = 16384,
    L = 32768,
    XL = 65536,
    XXL = 131072, -- default
    XXXL = 200000,
}

local function adapter(model, extend_adapter, num_ctx)
    return require('codecompanion.adapters').extend(extend_adapter or 'githubmodels', {
        num_ctx = num_ctx or CONTEXT_SIZES.XXL,
        name = model,
        schema = {
            model = { default = model },
            num_ctx = { default = num_ctx },
        },
    })
end

-- Setup with organized adapters
require('codecompanion').setup({
    adapters = {
        opts = { show_defaults = false },

        -- Ollama models
        ollama_qwen_coder_7b = adapter('qwen2.5-coder:7b', 'ollama', CONTEXT_SIZES.L),
        ollama_deepseek_coder = adapter('deepseek-coder:latest', 'ollama'),
        ollama_llama_3_1_8b = adapter('llama3.1:8b', 'ollama', CONTEXT_SIZES.S),

        -- Copilot models
        copilot_claude35 = adapter('claude-3.5-sonnet', 'copilot', CONTEXT_SIZES.XXXL),
        copilot_claude37 = adapter('claude-3.7-sonnet', 'copilot', CONTEXT_SIZES.XXXL),
        copilot_claude37_thought = adapter('claude-3.7-sonnet-thought', 'copilot', CONTEXT_SIZES.XXXL),
        copilot_gemini = adapter('gemini-2.0-flash-001', 'copilot'),
        copilot_gpt4o = adapter('gpt-4o-2024-11-20', 'copilot'),
        copilot_o1 = adapter('o1', 'copilot'),
        copilot_o3mini = adapter('o3-mini', 'copilot'),

        -- Github models - XXL context (131072)
        github_cohere_cmd_r = adapter('Cohere-command-r'),
        github_cohere_cmd_r_plus = adapter('Cohere-command-r-plus'),
        github_cohere_cmd_r_plus_08_2024 = adapter('Cohere-command-r-plus-08-2024'),
        github_llama_3_1_405b = adapter('Meta-Llama-3.1-405B-Instruct'),
        github_phi_3_medium = adapter('Phi-3-medium-128k-instruct'),
        github_phi_3_5_moe = adapter('Phi-3.5-MoE-instruct'),
        github_phi_4 = adapter('Phi-4'),
        github_gpt4o = adapter('gpt-4o'),
        github_llama_3_3_70b = adapter('Llama-3.3-70B-Instruct'),
        github_llama_3_2_90b_vision = adapter('Llama-3.2-90B-Vision-Instruct'),
        github_phi_3_5_vision = adapter('Phi-3.5-vision-instruct'),
        github_phi_4_multimodal = adapter('Phi-4-multimodal-instruct'),
        github_o1_preview = adapter('o1-preview'),
        github_gpt4o_mini = adapter('gpt-4o-mini'),

        -- Github models - Large context (32768)
        github_o1_mini = adapter('o1-mini', 'githubmodels', CONTEXT_SIZES.L),
        github_jamba_large = adapter('AI21-Jamba-1.5-Large', 'githubmodels', CONTEXT_SIZES.L),
        github_deepseek_r1 = adapter('DeepSeek-R1', 'githubmodels', CONTEXT_SIZES.L),
        github_deepseek_v3 = adapter('DeepSeek-V3', 'githubmodels', CONTEXT_SIZES.L),
        github_llama_3_2_11b_vision = adapter('Llama-3.2-11B-Vision-Instruct', 'githubmodels', CONTEXT_SIZES.L),
        github_mistral_large = adapter('Mistral-Large-2411', 'githubmodels', CONTEXT_SIZES.L),
        github_mistral_nemo = adapter('Mistral-Nemo', 'githubmodels', CONTEXT_SIZES.L),
        github_mistral_large_2407 = adapter('Mistral-large-2407', 'githubmodels', CONTEXT_SIZES.L),

        -- Github models - Medium/Small context
        github_codestral = adapter('Codestral-2501', 'githubmodels', CONTEXT_SIZES.M),
        github_jamba_mini = adapter('AI21-Jamba-1.5-Mini', 'githubmodels', CONTEXT_SIZES.S),
        github_ministral_3b = adapter('Ministral-3B', 'githubmodels', CONTEXT_SIZES.S),
        github_jais = adapter('jais-30b-chat', 'githubmodels', CONTEXT_SIZES.S),
    },

    strategies = {
        chat = {
            adapter = 'copilot_claude37_thought',
        },
        inline = {
            adapter = 'copilot_claude37',
        },
    },
})
