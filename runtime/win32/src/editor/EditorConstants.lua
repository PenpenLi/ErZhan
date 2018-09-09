
local EditorConstants = {}

EditorConstants.CHECK_POINT_DIST       = 6
EditorConstants.SELECTED_COLOR         = {255, 255, 255, 255}
EditorConstants.SELECTED_LABEL_COLOR   = {0, 0, 255}
EditorConstants.UNSELECTED_COLOR       = {180, 180, 180, 180}
EditorConstants.UNSELECTED_LABEL_COLOR = {0, 0, 0}
EditorConstants.LABEL_OFFSET_Y         = 4
EditorConstants.LABEL_FONT             = display.DEFAULT_TTF_FONT
EditorConstants.LABEL_FONT_SIZE        = 28 -- 14
EditorConstants.ROAD_ZORDER			   = 0			-- 显示的可行走区域的zorder
EditorConstants.STATIC_OBJECT_ZORDER   = 1			-- 静态物体的zorder先设为1
EditorConstants.LABEL_ZORDER           = 100
EditorConstants.POLYGON_ZORDER         = 1000
EditorConstants.CIRCLE_ZORDER          = 2000
EditorConstants.FLAG_ZORDER            = 3000
EditorConstants.RANGE_HANDLER_ZORDER   = 4000
EditorConstants.BINDING_LABEL_ZORDER   = 5000
EditorConstants.PANEL_ZORDER           = 10000

EditorConstants.MAP_PADDING            = 200
EditorConstants.MAP_TOOLBAR_HEIGHT     = 48

EditorConstants.PROPERTY_PREFIX_LEN    = 16
EditorConstants.BEHAVIOR_LABEL_WIDTH   = 110

EditorConstants.INSPECTOR_WIDTH        = 360   -- Object属性查看页面的宽度

EditorConstants.PANEL_BUTTON_SIZE      = 40
EditorConstants.PANEL_BUTTON_OFFSET    = 4
EditorConstants.PANEL_OFFSET           = 4
EditorConstants.PANEL_LABEL_FONT       = "Courier"
EditorConstants.PANEL_LABEL_FONT_SIZE  = 14  -- 13  -- 编辑器中右下角的属性面板现在的字体大小

EditorConstants.TOOLBAR_PADDING        = 40

EditorConstants.MAP_ROADTILE_WIDTH	   = 16

return EditorConstants
