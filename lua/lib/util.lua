local util = {}

util.get_user_config = function(key, default)
    local status_ok, user = pcall(require, 'user')
    if not status_ok then
        return default
    end

    local user_config = user[key]
    if user_config == nil then
        return default
    end
    return user_config
end

return util
