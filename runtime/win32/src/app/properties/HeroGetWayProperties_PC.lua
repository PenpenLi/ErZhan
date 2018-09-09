local HeroGetWayProperties = {}

local defines = {}

local getWay = {
    mainID            = "110202",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Unlock when through Stage1",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "解锁第一关时获得",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110202"] = getWay            --暗夜刺客

local getWay = {
    mainID            = "110101",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Unlock when through Stage2",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "解锁第二关时获得",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110101"] = getWay            --矮人索瑞尔

local getWay = {
    mainID            = "110201",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Unlock when through Stage3",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "解锁第三关时获得",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110201"] = getWay            --元素英雄帕里斯


local getWay = {
    mainID            = "110204",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Defeat The Ancient Behemoth",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "完成“击杀比蒙王”成就",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110204"] = getWay            --精灵射手

local getWay = {
    mainID            = "110102",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Earn 3 Stars In Stage8 on Normal",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "第一次三星通关第八关普通模式",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110102"] = getWay            --东方武僧

local getWay = {
    mainID            = "110203",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Earn 3 Stars In Stage9 on Normal",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "完成“第一次三星通关第九关普通模式”成就",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110203"] = getWay            --凯尔

local getWay = {
    mainID            = "110301",     --英雄ID
    money_EN          = 0,            --数值，单位为下面花费单位
    text_EN           = "Earn 3 Stars In Stage9 on Difficult",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "完成“第一次三星通关第九关困难模式”成就",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110301"] = getWay            --德鲁伊

local getWay = {
    mainID            = "110205",     --英雄ID
    money_EN          = 0,           --数值，单位为下面花费单位
    text_EN           = "Collect 72 Stars",           --获得途径
    money_CN          = 0,           --数值，单位为下面花费单位
    text_CN           = "完成“通关总星数达72星”成就",     --花费单位：$diamond$（钻石）/$money$（金钱）
}
defines["110205"] = getWay            --爱丽丝

function HeroGetWayProperties.get(i)
    return clone(defines[i])
end

function HeroGetWayProperties.getAll()
    return clone(defines)
end

return HeroGetWayProperties