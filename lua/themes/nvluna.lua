---@type Base46Table
-- NvLuna Theme for NvChad
-- A Material You theme that adapts to your system colors
-- Generated by Matugen

local M = {}

M.base_30 = {
  -- ألوان أساسية بتباين عالي جدًا
  white = "#e4e3d7", -- أبيض نقي للنص
  black = "#13140d", -- أسود نقي للخلفية
  darker_black = "#0b0c06", -- أسود أغمق للتباين
  black2 = "#1c1d16", -- أسود أفتح قليلاً

  -- خلفيات متدرجة بتباين واضح
  one_bg = "#22241c", -- خلفية العناصر
  one_bg2 = "#2d2e26", -- خلفية العناصر المرتفعة
  one_bg3 = "#383931", -- خلفية العناصر العالية
  lightbg = "#46483c", -- خلفية خفيفة
  statusline_bg = "#13140d", -- خلفية شريط الحالة
  line = "#646558", -- لون الخطوط والحدود

  -- ألوان النص بتباين عالي
  light_grey = "#e8e7db", -- نص فاتح
  grey_fg2 = "#c7c8b8", -- نص متوسط
  grey_fg = "#c7c8b8", -- نص رمادي
  grey = "#969789", -- نص رمادي غامق

  -- ألوان أساسية مشرقة
  blue = "#bdce80", -- اللون الأساسي
  red = "#ffb4ab", -- لون الخطأ
  green = "#c4caa9", -- اللون الثانوي
  yellow = "#a1d0c5", -- اللون الثلاثي
  orange = "#406c63", -- حاوية اللون الثلاثي
  baby_pink = "#c32220", -- حاوية لون الخطأ

  -- ألوان إضافية مشرقة
  nord_blue = "#5c6a28", -- حاوية اللون الأساسي
  dark_purple = "#62674c", -- حاوية اللون الثانوي
  teal = "#4f5d1c", -- اللون الأساسي المعكوس
  purple = "#e4e3d7", -- لون السطح المعكوس
  pink = "#bdce80", -- نسخة من اللون الأساسي للوردي

  -- ألوان عناصر الواجهة
  pmenu_bg = "#bdce80", -- خلفية القائمة
  folder_bg = "#bdce80", -- لون المجلدات

  -- ألوان مميزة إضافية
  cyan = "#406c63", -- لون مميز إضافي
  sun = "#a1d0c5", -- لون مشرق
  vibrant_green = "#c4caa9", -- أخضر مشرق
  seablue = "#5c6a28", -- أزرق بحري
}

-- تمييز نحوي بتباين عالي - Syntax highlighting with high contrast
-- استنادًا إلى https://github.com/chriskempson/base16/blob/master/styling.md
M.base_16 = {
  -- ألوان الخلفية بتباين عالي
  base00 = "#13140d", -- الخلفية الافتراضية
  base01 = "#1c1d16", -- خلفية أفتح (أشرطة الحالة، أرقام الأسطر)
  base02 = "#22241c", -- خلفية التحديد

  -- ألوان النص بتباين عالي
  base03 = "#969789", -- التعليقات، العناصر غير المرئية
  base04 = "#c7c8b8", -- نص أمامي داكن (أشرطة الحالة)
  base05 = "#e4e3d7", -- النص الأمامي الافتراضي، المؤشر، المحددات
  base06 = "#e8e7db", -- نص أمامي فاتح
  base07 = "#e8e7db", -- خلفية فاتحة (نادرة الاستخدام)

  -- ألوان التمييز النحوي - مشرقة ومتميزة
  base08 = "#ffb4ab", -- المتغيرات، علامات XML، نص الروابط
  base09 = "#a1d0c5", -- الأعداد، القيم المنطقية، الثوابت
  base0A = "#406c63", -- الفئات، النص الغامق، خلفية نص البحث
  base0B = "#c4caa9", -- السلاسل النصية، الفئات الموروثة، الشفرة
  base0C = "#62674c", -- الدعم، التعبيرات العادية، أحرف الهروب
  base0D = "#bdce80", -- الوظائف، الطرق، معرفات السمات، العناوين
  base0E = "#5c6a28", -- الكلمات المفتاحية، التخزين، المحدد
  base0F = "#c32220", -- العناصر المهملة، علامات اللغة المضمنة
}

-- مجموعات تمييز إضافية لتحسين الواجهة - Additional highlight groups for better UI
M.polish_hl = {
  -- تحسين تمييز العناصر النحوية
  ["@variable"] = {
    fg = M.base_16.base08, -- لون مشرق للمتغيرات
    italic = true, -- جعل المتغيرات مائلة للتمييز
  },

  ["@function"] = {
    fg = M.base_16.base0D, -- لون مميز للدوال
    bold = true, -- جعل الدوال غامقة لرؤية أفضل
  },

  ["@keyword"] = {
    fg = M.base_16.base0E, -- لون مميز للكلمات المفتاحية
    bold = true, -- جعل الكلمات المفتاحية غامقة
  },

  ["@string"] = {
    fg = M.base_16.base0B, -- لون مشرق للنصوص
  },

  ["@number"] = {
    fg = M.base_16.base09, -- لون مميز للأرقام
    bold = true, -- جعل الأرقام غامقة للتمييز
  },

  -- تعليقات بوضوح أفضل
  Comment = {
    fg = M.base_16.base03,
    italic = true, -- جعل التعليقات مائلة للتمييز
  },

  -- خط المؤشر بخلفية واضحة
  CursorLine = {
    bg = M.base_30.black2,
  },

  -- تحسين تمييز الأخطاء
  Error = {
    fg = M.base_16.base08, -- أحمر مشرق للأخطاء
    bold = true, -- جعلها غامقة لرؤية أفضل
    undercurl = true, -- إضافة خط متموج تحت الأخطاء
  },

  -- تحسين عناصر الواجهة
  NvDashAscii = {
    fg = M.base_30.blue, -- لون مميز لشعار لوحة البداية
    bg = "NONE",
  },

  -- شريط الحالة بتباين أفضل
  StatusLine = {
    bg = M.base_30.black2, -- خلفية داكنة لشريط الحالة
    fg = M.base_30.white, -- نص أبيض في شريط الحالة
  },

  -- التبويب النشط بلون مميز
  TabLineSel = {
    bg = M.base_30.blue, -- خلفية مميزة للتبويب النشط
    fg = M.base_30.white, -- نص أبيض في التبويب النشط
    bold = true, -- جعله غامقًا للتمييز
  },

  -- شريط التبويبات بتباين أفضل
  BufferLineFill = {
    bg = M.base_30.black, -- خلفية داكنة لشريط التبويبات
  },

  -- التبويب المحدد بلون مميز
  BufferLineBufferSelected = {
    fg = M.base_30.white, -- نص أبيض في التبويب المحدد
    bg = M.base_30.blue, -- خلفية مميزة للتبويب المحدد
    bold = true, -- جعله غامقًا للتمييز
    italic = true, -- إضافة نمط مائل للتمييز الإضافي
  },

  -- بحث FZF بتباين أفضل للعنصر المحدد
  TelescopeSelection = {
    bg = M.base_30.blue, -- خلفية مميزة للعنصر المحدد
    fg = M.base_30.white, -- نص أبيض للعنصر المحدد
    bold = true, -- جعله غامقًا للتمييز
  },

  TelescopeSelectionCaret = {
    fg = M.base_30.white, -- لون مؤشر التحديد
    bg = M.base_30.blue, -- خلفية مؤشر التحديد
    bold = true, -- جعله غامقًا للتمييز
  },

  TelescopePromptPrefix = {
    fg = M.base_30.blue, -- لون بادئة موجه الإدخال
    bold = true, -- جعله غامقًا للتمييز
  },

  TelescopeBorder = {
    fg = M.base_30.blue, -- لون حدود النافذة
  },

  -- FZF بتباين أفضل
  FzfLuaDefault = {
    fg = M.base_30.white, -- لون النص الافتراضي
  },

  FzfLuaCursor = {
    fg = M.base_30.black, -- لون النص عند المؤشر
    bg = M.base_30.blue, -- خلفية المؤشر
    bold = true, -- جعله غامقًا للتمييز
  },

  FzfLuaSelected = {
    fg = M.base_30.white, -- لون النص المحدد
    bg = M.base_30.blue, -- خلفية العنصر المحدد
    bold = true, -- جعله غامقًا للتمييز
    italic = true, -- إضافة نمط مائل للتمييز الإضافي
  },

  -- مدير الملفات بتمييز أفضل
  NvimTreeCursorLine = {
    bg = M.base_30.blue, -- خلفية السطر المحدد
    fg = M.base_30.white, -- لون النص في السطر المحدد
    bold = true, -- جعله غامقًا للتمييز
  },

  NvimTreeOpenedFile = {
    fg = M.base_30.blue, -- لون الملف المفتوح
    bold = true, -- جعله غامقًا للتمييز
    italic = true, -- إضافة نمط مائل للتمييز الإضافي
  },

  -- تحسين تمييز الكلمات المفتاحية والدوال
  Keyword = {
    fg = M.base_16.base0E,
    bold = true,
    italic = true, -- إضافة نمط مائل للتمييز الإضافي
  },

  Function = {
    fg = M.base_16.base0D,
    bold = true,
  },

  -- تحسين تمييز المتغيرات والثوابت
  Identifier = {
    fg = M.base_16.base08,
    italic = true, -- جعل المتغيرات مائلة للتمييز
  },

  Constant = {
    fg = M.base_16.base09,
    bold = true, -- جعل الثوابت غامقة للتمييز
  },
}

-- Set the theme type (dark or light)
M.type = "dark"

-- This will be used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "nvluna")

return M
