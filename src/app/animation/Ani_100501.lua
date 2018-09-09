
-- 角色100401配置


local AnimationData     = {
    -- Attack_01 动画配置
    Attack_01           = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17},    -- 帧的播放顺序
        fireFrame       = {5},                                  -- 第几帧的时候触发fire事件
    },

    -- Attack_02 动画配置
    Attack_02           = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18},    -- 帧的播放顺序
        fireFrame       = {7},                                  -- 第几帧的时候触发fire事件
    },

    -- Coma 动画配置
    Coma                = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},    -- 帧的播放顺序
        -- fireFrame       = {7},                                  -- 第几帧的时候触发fire事件
    },

    -- Death 动画配置
    Death               = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},    -- 帧的播放顺序
        -- fireFrame       = {7},                                  -- 第几帧的时候触发fire事件
    },

    -- Deathed 动画配置
    Deathed             = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0},    -- 帧的播放顺序
        -- fireFrame       = {7},                                  -- 第几帧的时候触发fire事件
    },

    -- Idle 动画配置
    Idle                = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},    -- 帧的播放顺序
        -- fireFrame       = {4},                                  -- 第几帧的时候触发fire事件
    },

    -- Move_Side 动画配置
    Move_Side           = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19},    -- 帧的播放顺序
        fireFrame       = {4},                                  -- 第几帧的时候触发fire事件
    },

    -- Skill_01 动画配置
    Skill_01            = {
        intervalTime    = 0.07,                                -- 每一帧的间隔时间
        frames          = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14},     -- 帧的播放顺序
        fireFrame       = {6},                                -- 第几帧的时候触发fire事件
    },
}

return AnimationData
