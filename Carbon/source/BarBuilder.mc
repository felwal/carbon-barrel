using Toybox.Graphics;

module Carbon {

    (:Graphite :glance)
    module Graphite {

        class BarBuilder {

        	protected static const BAR_STROKE = 3;
            protected static const INDICATOR_STROKE = 2;

            public static const BAR_SMALL = 3;
            public static const BAR_MEDIUM = 7;
            public static const BAR_BIG = 11;

            protected static const INDICATOR_WIDTH = BAR_SMALL;
            protected static const INDICATOR_HEIGHT = 17;

            private var _bars = [];
            private var _indicators = [];

            //

            public function initialize() {
            }

            public function addBar(xStart, xEnd, height, color) {
                _bars.add(new Bar(xStart, xEnd, height, color));
            }

            public function addIndicator(x, color) {
                _indicators.add(new Indicator(x, color));
            }

            public function build(dc) {
                var yCenter = dc.getHeight() / 2;

                for (var i = 0; i < _bars.size(); i++) {
                    var bar = _bars[i];
                    dc.setColor(bar.color, Graphics.COLOR_BLACK);
                    strokeRectangle(dc, bar.start, yCenter - bar.height / 2, bar.end - bar.start, bar.height, BAR_STROKE, bar.color, Graphics.COLOR_BLACK);
                }

                for (var i = 0; i < _indicators.size(); i++) {
                    var indicator = _indicators[i];
                    strokeRectangleCentered(dc, indicator.x, yCenter, INDICATOR_WIDTH, INDICATOR_HEIGHT, INDICATOR_STROKE, indicator.color, Graphics.COLOR_BLACK);
                }

            }

            //

            class Bar {
            
                public var start;
                public var end;
                public var height;
                public var color;

                function initialize(start, end, height, color) {
                    self.start = start;
                    self.end = end;
                    self.height = height;
                    self.color = color;
                }

            }

            class Indicator {
            
                public var x;
                public var color;

                function initialize(x, color) {
                    self.x = x;
                    self.color = color;
                }

            }

        }

    }

}
