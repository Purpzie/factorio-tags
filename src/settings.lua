data:extend{
    {
        setting_type = "runtime-global",
        name = "tags-prefix",
        type = "string-setting",
        default_value = "",
        allow_blank = true,
        order = "1"
    },
    {
        setting_type = "runtime-global",
        name = "tags-suffix",
        type = "string-setting",
        default_value = "",
        allow_blank = true,
        order = "2"
    },
    {
        setting_type = "runtime-global",
        name = "tags-admin-only",
        type = "bool-setting",
        default_value = false,
        order = "3"
    },
    {
        setting_type = "runtime-global",
        name = "tags-max-length",
        type = "int-setting",
        default_value = 20,
        allow_blank = true,
        order = "4"
    }
}
