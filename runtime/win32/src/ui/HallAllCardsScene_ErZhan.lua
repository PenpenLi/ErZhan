

local GlobalData             = require("tools.GlobalData")
local RMBSkillProperties     = require("app.properties.RMBSkillProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local HallAllCardsScene_ErZhan = class("HallAllCardsScene_ErZhan")

local scheduler = require("framework.scheduler")
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
-- 第3个参数表示是通过战斗页面点击进来的，点击了第几个道具，然后要默认选中这个道具
function HallAllCardsScene_ErZhan:ctor(self, finc, itemIndex)
    
    print("HallAllCardsScene_ErZhan:ctor")
    self._stepID = 0
    -- 关闭页面的回调函数
    self.finc = finc
    -- 需要默认选中第几个道具
    self.itemIndex = itemIndex

    -- 记录在场的卡牌
    self._cardsNode = {}

    local clickBack = function(luaFileName,node,callbackName)  
        print("callbackName = "..tostring(callbackName))
        if callbackName == "clickEvent" then
            return function ()
                print("node:getName() = "..tostring(node:getName()))
            end         
        end      
    end
    self.studioPage = import("ui.HallAllCardsNode.lua").create(clickBack)
    local itemStoreStudio = self.studioPage.root
   
 
    print("HallAllCardsScene_ErZhan:ctor 1")
    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()

    -- -- 获得Studio中的所有控件
    self:getAllElemets()

    local function callBack(sender,eventType)
        if self.showNextLv and self.showNextLv > 0 then return end
        local name = sender:getName()
        if eventType == ccui.TouchEventType.began then
            if name == "Button_My_Card_5" then
                print("click begin studioPage.Button_My_Card_5")
            end
        end
        if eventType == ccui.TouchEventType.ended then
            AudioMgr.playSound("cardDetail")
            print("click end name = "..tostring(name).." self._stepID = "..tostring(self._stepID))
            if name == "Button_1" then
                -- Button_1 点击日军
                self:onClickRiJun()
            elseif name =="Button_2" then
                -- Button_1 点击国军
                self:onClickGuoJun()
            elseif name =="Button_3" then
                -- Button_1 点击共军
                self:onClickGongJun()
            elseif name =="Button_4" then
                -- Button_1 点击德军
                -- self:onClickDeJun()
            elseif name =="Button_5" then
                -- Button_1 点击苏军
                -- self:onClickSuJun()
            elseif name == "Button_Hall_1" then
                self:onClickCard_1()
            elseif name == "Button_Hall_4" then
                self:onClickCard_4()
            elseif name == "Button_Hall_10" then
                self:onClickCard_10()
            elseif name == "Button_6" then
                -- 点击详情页面的关闭页面
                self:onClickDetialCloseBtn()
            elseif name == "Button_To_Hall" then
                -- 显示大厅页面
                viewMgr.show(viewMgr.def.HallScene_ErZhan_UI)
                viewMgr.hide(viewMgr.def.HallAllCardsScene_ErZhan)
            end
        end
        if eventType == ccui.TouchEventType.canceled then
        end
    end
    -- Button_1 点击日军
    self.studioPage.Button_1:addTouchEventListener(callBack)
    -- Button_2 点击国军
    self.studioPage.Button_2:addTouchEventListener(callBack)
    -- Button_3 点击共军
    self.studioPage.Button_3:addTouchEventListener(callBack)
    

    -- 点击第四张卡和第十张卡
    self.studioPage.Button_Hall_1:addTouchEventListener(callBack)
    self.studioPage.Button_Hall_4:addTouchEventListener(callBack)
    self.studioPage.Button_Hall_10:addTouchEventListener(callBack)

    self.studioPage.Button_To_Hall:addTouchEventListener(callBack)

    self.studioPage.Button_6:addTouchEventListener(callBack)


    print("HallAllCardsScene_ErZhan:ctor 3")



end

function HallAllCardsScene_ErZhan:onEnter()
    -- 提示玩家点击哪个按钮的图片
    print("HallAllCardsScene_ErZhan:onEnter()")
    self._nowShowCountry = "GuoJun"
    self.studioPage.Button_Hall_10:setEnabled(true)
    self.studioPage.Button_Hall_4:setEnabled(false)
    
    self.chooseCard1 = self.studioPage.Button_1:getChildByName("Image_1")
    self.chooseCard2 = self.studioPage.Button_2:getChildByName("Image_1")
    self.chooseCard3 = self.studioPage.Button_3:getChildByName("Image_1")
    self.chooseCard4 = self.studioPage.Button_4:getChildByName("Image_1")
    self.chooseCard5 = self.studioPage.Button_5:getChildByName("Image_1")

    self.chooseCardImg1 = self.studioPage.Button_1:getChildByName("Image_2")
    self.chooseCardImg2 = self.studioPage.Button_2:getChildByName("Image_2")
    self.chooseCardImg3 = self.studioPage.Button_3:getChildByName("Image_2")
    self.chooseCardImg4 = self.studioPage.Button_4:getChildByName("Image_2")
    self.chooseCardImg5 = self.studioPage.Button_5:getChildByName("Image_2")
end

-- 点击日军按钮, 显示日军卡片
function HallAllCardsScene_ErZhan:onClickRiJun()
    self._nowShowCountry = "RiJun"
    self.studioPage.Button_Hall_10:setEnabled(false)
    self.studioPage.Button_Hall_4:setEnabled(true)

    self.studioPage.guoJun_1_1:setTexture("hallAllCards/riJun/riJun_1.png")
    self.studioPage.guoJun_1_2:setTexture("hallAllCards/riJun/riJun_2.png")
    self.studioPage.guoJun_1_3:setTexture("hallAllCards/riJun/riJun_3.png")
    self.studioPage.guoJun_1_4:setTexture("hallAllCards/riJun/riJun_4.png")
    self.studioPage.guoJun_1_5:setTexture("hallAllCards/riJun/riJun_5.png")
    self.studioPage.guoJun_1_6:setTexture("hallAllCards/riJun/riJun_6.png")
    self.studioPage.guoJun_1_7:setTexture("hallAllCards/riJun/riJun_7.png")
    self.studioPage.guoJun_1_8:setTexture("hallAllCards/riJun/riJun_8.png")
    self.studioPage.guoJun_1_9:setTexture("hallAllCards/riJun/riJun_9.png")
    self.studioPage.guoJun_1_10:setTexture("hallAllCards/riJun/riJun_10.png")

    self.studioPage.guoJun_1_7:setVisible(true)
    self.studioPage.guoJun_1_8:setVisible(true)
    self.studioPage.guoJun_1_9:setVisible(true)
    self.studioPage.guoJun_1_10:setVisible(true)

    self.chooseCard1:setVisible(true)
    self.chooseCard2:setVisible(false)
    self.chooseCard3:setVisible(false)
    self.chooseCard4:setVisible(false)
    self.chooseCard5:setVisible(false)

    self.chooseCardImg1:loadTexture("riJun_Hei")
    self.chooseCardImg2:loadTexture("guoJun")
    self.chooseCardImg3:loadTexture("gongJun")

end

-- 点击国军按钮, 显示国军卡片
function HallAllCardsScene_ErZhan:onClickGuoJun()
    self._nowShowCountry = "GuoJun"
    self.studioPage.Button_Hall_10:setEnabled(true)
    self.studioPage.Button_Hall_4:setEnabled(false)

    self.studioPage.guoJun_1_1:setTexture("hallAllCards/guoJun_1.png")
    self.studioPage.guoJun_1_2:setTexture("hallAllCards/guoJun_2.png")
    self.studioPage.guoJun_1_3:setTexture("hallAllCards/guoJun_3.png")
    self.studioPage.guoJun_1_4:setTexture("hallAllCards/guoJun_4.png")
    self.studioPage.guoJun_1_5:setTexture("hallAllCards/guoJun_5.png")
    self.studioPage.guoJun_1_6:setTexture("hallAllCards/guoJun_6.png")
    self.studioPage.guoJun_1_7:setTexture("hallAllCards/guoJun_7.png")
    self.studioPage.guoJun_1_8:setTexture("hallAllCards/guoJun_8.png")
    self.studioPage.guoJun_1_9:setTexture("hallAllCards/guoJun_9.png")
    self.studioPage.guoJun_1_10:setTexture("hallAllCards/guoJun_10.png")

    self.studioPage.guoJun_1_7:setVisible(true)
    self.studioPage.guoJun_1_8:setVisible(true)
    self.studioPage.guoJun_1_9:setVisible(true)
    self.studioPage.guoJun_1_10:setVisible(true)

    self.chooseCard1:setVisible(false)
    self.chooseCard2:setVisible(true)
    self.chooseCard3:setVisible(false)
    self.chooseCard4:setVisible(false)
    self.chooseCard5:setVisible(false)

    self.chooseCardImg1:loadTexture("riJun")
    self.chooseCardImg2:loadTexture("guoJun_Hei")
    self.chooseCardImg3:loadTexture("gongJun")

end

-- 点击共军按钮, 显示共军卡片
function HallAllCardsScene_ErZhan:onClickGongJun()
    self._nowShowCountry = "GongJun"
    self.studioPage.Button_Hall_10:setEnabled(true)
    self.studioPage.Button_Hall_4:setEnabled(false)

    self.studioPage.guoJun_1_1:setTexture("hallAllCards/gongJun/gongJun_1.png")
    self.studioPage.guoJun_1_2:setTexture("hallAllCards/gongJun/gongJun_2.png")
    self.studioPage.guoJun_1_3:setTexture("hallAllCards/gongJun/gongJun_3.png")
    self.studioPage.guoJun_1_4:setTexture("hallAllCards/gongJun/gongJun_4.png")
    self.studioPage.guoJun_1_5:setTexture("hallAllCards/gongJun/gongJun_5.png")
    self.studioPage.guoJun_1_6:setTexture("hallAllCards/gongJun/gongJun_6.png")
    self.studioPage.guoJun_1_7:setVisible(false)
    self.studioPage.guoJun_1_8:setVisible(false)
    self.studioPage.guoJun_1_9:setVisible(false)
    self.studioPage.guoJun_1_10:setVisible(false)

    self.chooseCard1:setVisible(false)
    self.chooseCard2:setVisible(false)
    self.chooseCard3:setVisible(true)
    self.chooseCard4:setVisible(false)
    self.chooseCard5:setVisible(false)

    self.chooseCardImg1:loadTexture("riJun")
    self.chooseCardImg2:loadTexture("guoJun")
    self.chooseCardImg3:loadTexture("gongJun_Hei")
end

-- 点击共军第一张卡牌
function HallAllCardsScene_ErZhan:onClickCard_1( ... )
    self.studioPage.Panel_Card_Detail:setVisible(true)

    self.studioPage.card_Img:loadTexture("hallAllCards/gongJun/gongJun_1.png")
    self.studioPage.Text_Card_Name:setString("八路军 343旅")
    self.studioPage.Text_Fire:setString("800")
    self.studioPage.Text_Blood:setString("900")
    self.studioPage.Text_Attack_Range:setString("1")
    self.studioPage.Text_Defence:setString("步兵单位")
    self.studioPage.Text_1:setString("潜行技能的单位，不暴露时\n免疫首次伤害，伏击首选。")
    self.studioPage.Text_Card_Detail:setString("八路军，全称为国民革命军第八路军，后改称国民革命军第十八集团军，隶属国民革命军战斗序列，是中国共产党领导的抗日部队，中国人民解放军的前身之一。115师：八路军三大主力之一，1937年9月25在平型关取得首战大捷，是八路军出师以来打的第一个大胜仗，打破了日军“不可战胜”的神话，极大地振奋了人心，增强了全国人民和各爱国武装力量坚持抗战的信心和决心。")
end

-- 点击日军页面第四张卡牌
function HallAllCardsScene_ErZhan:onClickCard_4( ... )
    -- body
    self.studioPage.Panel_Card_Detail:setVisible(true)

    self.studioPage.card_Img:loadTexture("hallAllCards/riJun/riJun_4.png")
    self.studioPage.Text_Card_Name:setString("日军 13师团")
    self.studioPage.Text_Fire:setString("700")
    self.studioPage.Text_Blood:setString("600")
    self.studioPage.Text_Attack_Range:setString("2")
    self.studioPage.Text_Defence:setString("步兵单位")
    self.studioPage.Text_1:setString("生命值、战斗力都很高！")
    self.studioPage.Text_Card_Detail:setString("第13师团是日本原常备甲种师团，是甲种师团中的王牌，战斗力强。1937年9月10日重建，先后参加淞沪会战、江阴保卫战、武汉会战等，是侵华战争中的急先锋和南京大屠杀罪恶之首。日本人所著《昭和12年，支那南京攻略战》记载：在旅团、联队一级中：佐佐木道一部、山田丹二部，65联队（以上都隶属荻洲立兵第13师团）最勇猛，屠宰支那战俘和南京平民，超过70000人。1945年9月初在节节败退中迎来了无条件投降的那一天。")
end

function HallAllCardsScene_ErZhan:onClickCard_10( ... )
    -- body
    self.studioPage.Panel_Card_Detail:setVisible(true)

    self.studioPage.card_Img:loadTexture("hallAllCards/guoJun_10.png")
    self.studioPage.Text_Card_Name:setString("国军 中国远征军")
    self.studioPage.Text_Fire:setString("500")
    self.studioPage.Text_Blood:setString("1100")
    self.studioPage.Text_Attack_Range:setString("1")
    self.studioPage.Text_Defence:setString("步兵单位")
    self.studioPage.Text_1:setString("发动奔袭时行动力为3，\n出奇制胜。")
    self.studioPage.Text_Card_Detail:setString("中国远征军是抗日战争时期中国入缅对日作战部队，亦称“中国赴缅远征军”。1941年12月根据《中英共同防御滇缅路协定》编成，远征军受盟军中国战区参谋长史迪威中将和罗卓英司令长官指挥。该军由第5、第6、第66军编成，计9个师10万余人。中国远征军是中国与盟国直接进行军事合作的典范，也是甲午战争以来中国军队首次出国作战。1943年10月至1945年3月，中国驻印军和中国远征军在缅北、滇西反攻中，收复缅北大小城镇50余座，收复滇西失地8.3万平方公里，共歼灭日军4.9万余人。中国军队也付出了重大牺牲，伤亡官兵约6.7万人。")

end

function HallAllCardsScene_ErZhan:onClickDetialCloseBtn( ... )
    self.studioPage.Panel_Card_Detail:setVisible(false)
end

-- 记录所有的控件
function HallAllCardsScene_ErZhan:getAllElemets()

end

-- 获得node页面
function HallAllCardsScene_ErZhan:getPage()
    print("HallAllCardsScene_ErZhan:getPage()")
    return self.studioNode
end

return HallAllCardsScene_ErZhan