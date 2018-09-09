local HeroGetWayProperties = {}

local defines = {}

local getWay = {
    mainID            = "110202",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "解锁第一关时获得",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "解锁第一关时获得",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110202"] = getWay            --暗夜刺客

local getWay = {
    mainID            = "110101",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "解锁第二关时获得",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "解锁第二关时获得",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110101"] = getWay            --矮人索瑞尔

local getWay = {
    mainID            = "110201",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "解锁第三关时获得",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "解锁第三关时获得",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110201"] = getWay            --元素英雄帕里斯


local getWay = {
    mainID            = "110204",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "完成“击败比蒙王”成就",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "完成“击败比蒙王”成就",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110204"] = getWay            --精灵射手

local getWay = {
    mainID            = "110102",     --英雄ID
    money_EN          = 400,           --数值，单位为下面花费单位
    text_EN           = "花费$400$diamond$获得!",           --获得途径
    money_CN          = 400,           --数值，单位为下面花费单位
    text_CN           = "花费$400$diamond$获得!",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110102"] = getWay            --东方武僧

local getWay = {
    mainID            = "110203",     --英雄ID
    money_EN          = 3,           --数值，单位为下面花费单位
    text_EN           = "花费$3$money$获得!",           --获得途径
    money_CN          = 18,           --数值，单位为下面花费单位
    text_CN           = "花费$18$money$获得!",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110203"] = getWay            --凯尔

local getWay = {
    mainID            = "110301",     --英雄ID
    money_EN          = 6,            --数值，单位为下面花费单位
    text_EN           = "花费$6$money$获得!",           --获得途径
    money_CN          = 24,           --数值，单位为下面花费单位
    text_CN           = "花费$24$money$获得!",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110301"] = getWay            --德鲁伊

local getWay = {
    mainID            = "110205",     --英雄ID
    money_EN          = 10,           --数值，单位为下面花费单位
    text_EN           = "花费$10$money$获得!",           --获得途径
    money_CN          = 30,           --数值，单位为下面花费单位
    text_CN           = "花费$30$money$获得!",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110205"] = getWay            --爱丽丝

function HeroGetWayProperties.get(i)
    return clone(defines[i])
end

function HeroGetWayProperties.getAll()
    return clone(defines)
end

return HeroGetWayProperties