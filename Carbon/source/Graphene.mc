using Toybox.Graphics;

module Carbon {

    //! The Graphene module contains simplified font- and extended color-constants
    (:Graphene :glance)
    module Graphene {

        // font

        // Roboto Condensed
        public const FONT_XTINY = 0; // Graphics.FONT_XTINY, 19sp
        public const FONT_TINY = 1; // Graphics.FONT_TINY, 26sp
        public const FONT_SMALL = 2; // Graphics.FONT_SMALL, 29sp
        public const FONT_MEDIUM = 3; // Graphics.FONT_MEDIUM, 34sp
        public const FONT_LARGE = 4; // Graphics.FONT_LARGE, 37sp

        // Roboto Black
        public const FONT_MILD = 5; // Graphics.FONT_NUMBER_MILD, 54sp
        //public const FONT_MEDIUM = 6; // Graphics.FONT_NUMBER_MILD, ?sp
        public const FONT_HOT = 7; // Graphics.FONT_NUMBER_HOT, 82sp
        public const FONT_THAI_HOT = 8; // Graphics.FONT_NUMBER_THAI_HOT, 94sp

        // quaternary color

        // abbreviations:
        // * DK: dark (value)
        // * LT: light (value)
        // * DR: darker (value)
        // * LR: lighter (value)
        // * WK: weak (chroma)

        // RGB mono
        public const COLOR_BLACK = 0x000000; // Graphics.COLOR_BLACK
        public const COLOR_DK_GRAY = 0x555555; // Graphics.COLOR_DK_GRAY
        public const COLOR_LT_GRAY = 0xAAAAAA; // Graphics.COLOR_LT_GRAY
        public const COLOR_WHITE = 0xFFFFFF; // Graphics.COLOR_WHITE

        // ordering:
        // * primary
        // **** quaternary
        // *** tertiary
        // **** quaternary
        // ** secondary
        // **** quaternary
        // *** tertiary
        // **** quaternary
        // * primary

        // R red
        public const COLOR_DR_RED = 0x550000;
        public const COLOR_DK_RED = 0xAA0000; // Graphics.COLOR_DK_RED
        public const COLOR_RED = 0xFF0000; // Graphics.COLOR_RED
        public const COLOR_LT_RED = 0xFF5555;
        public const COLOR_LR_RED = 0xFFAAAA;
        public const COLOR_WK_RED = 0xAA5555;

        // RGRR vermilion
        public const COLOR_VERMILION = 0xFF5500; // Graphics.COLOR_ORANGE

        // RGR orange
        public const COLOR_DK_ORANGE = 0xAA5500;
        public const COLOR_LT_ORANGE = 0xFFAA55;

        // RGRG amber
        public const COLOR_AMBER = 0xFFAA00; // Graphics.COLOR_YELLOW

        // RG yellow
        public const COLOR_DR_YELLOW = 0x555500;
        public const COLOR_DK_YELLOW = 0xAAAA00;
        public const COLOR_YELLOW = 0xFFFF00;
        public const COLOR_LT_YELLOW = 0xFFFF55;
        public const COLOR_LR_YELLOW = 0xFFFFAA;
        public const COLOR_WK_YELLOW = 0xAAAA55;

        // RGGR lime
        public const COLOR_LIME = 0xAAFF00;

        // RGG chartreuse
        public const COLOR_DK_CHARTREUSE = 0x55AA00;
        public const COLOR_LT_CHARTREUSE = 0xAAFF55;

        // RGGG harlequin
        public const COLOR_HARLEQUIN = 0x55FF00;

        // G green
        public const COLOR_DR_GREEN = 0x005500;
        public const COLOR_DK_GREEN = 0x00AA00; // Graphics.COLOR_DK_GREEN
        public const COLOR_GREEN = 0x00FF00; // Graphics.COLOR_GREEN
        public const COLOR_LT_GREEN = 0x55FF55;
        public const COLOR_LR_GREEN = 0xAAFFAA;
        public const COLOR_WK_GREEN = 0x55AA55;

        // GBGG erin
        public const COLOR_ERIN = 0x00FF55;

        // GBG spring green
        public const COLOR_DK_SPRING = 0x00AA55;
        public const COLOR_LT_SPRING = 0x55FFAA;

        // GBGG aquamarine
        public const COLOR_AQUAMARINE = 0x00FFAA;

        // GB cyan
        public const COLOR_DR_CYAN = 0x005555;
        public const COLOR_DK_CYAN = 0x00AAAA;
        public const COLOR_CYAN = 0x00FFFF;
        public const COLOR_LT_CYAN = 0x55FFFF;
        public const COLOR_LR_CYAN = 0xAAFFFF;
        public const COLOR_WK_CYAN = 0x55AAAA;

        // GBBG capri
        public const COLOR_CAPRI = 0x00AAFF; // Graphics.COLOR_BLUE

        // GBB azure
        public const COLOR_DK_AZURE = 0x0055AA;
        public const COLOR_LT_AZURE = 0x55AAFF;

        // GBBB cerulian
        public const COLOR_CERULIAN = 0x0055FF;

        // B blue
        public const COLOR_DR_BLUE = 0x000055;
        public const COLOR_DK_BLUE = 0x0000AA;
        public const COLOR_BLUE = 0x0000FF; // Graphics.COLOR_DK_BLUE
        public const COLOR_LT_BLUE = 0x5555FF;
        public const COLOR_LR_BLUE = 0xAAAAFF;
        public const COLOR_WK_BLUE = 0x5555AA;

        // RBBB indigo
        public const COLOR_INDIGO = 0x5500FF;

        // RBB violet
        public const COLOR_DK_VIOLET = 0x5500AA;
        public const COLOR_LT_VIOLET = 0xAA55FF;

        // RBBR purple
        public const COLOR_PURPLE = 0xAA00FF; // Graphics.COLOR_PURPLE

        // RB magenta
        public const COLOR_DR_MAGENTA = 0x550055;
        public const COLOR_DK_MAGENTA = 0xAA00AA;
        public const COLOR_MAGENTA = 0xFF00FF; // Graphics.COLOR_PINK
        public const COLOR_LT_MAGENTA = 0xFF55FF;
        public const COLOR_LR_MAGENTA = 0xFFAAFF;
        public const COLOR_WK_MAGENTA = 0xAA55AA;

        // RBRB cerise
        public const COLOR_CERISE = 0xFF00AA;

        // RBR rose
        public const COLOR_DK_ROSE = 0xAA0055;
        public const COLOR_LT_ROSE = 0xFF55AA;

        // RBRR crimson
        public const COLOR_CRIMSON = 0xFF0055;

    }

}
