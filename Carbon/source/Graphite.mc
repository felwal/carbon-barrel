using Toybox.Graphics;

module Carbon {

    //! The Graphite module provides extended drawing functionality
    (:Graphite :glance)
    module Graphite {

        public const STROKE = 2;

        // color

        //! Set the current foreground color
        public function setColor(dc, foreground) {
            dc.setColor(foreground, Graphene.COLOR_BLACK);
        }

        //! Set the current fg and bg colors to white and black
        public function resetColor(dc) {
            dc.setColor(Graphene.COLOR_WHITE, Graphene.COLOR_BLACK);
        }

        // primitive

        //! Fill a rectangle around a point
        public function fillRectangleCentered(dc, xCenter, yCenter, width, height) {
            dc.fillRectangle(xCenter - width / 2, yCenter - height / 2, width, height);
        }

        // stroke

        //! Fill a circle with an outside stroke
        public function strokeCircle(dc, x, y, r, strokeWidth, fillColor, strokeColor) {
            // stroke
            setColor(dc, strokeColor);
            dc.fillCircle(x, y, r + strokeWidth);

            // fill
            setColor(dc, fillColor);
            dc.fillCircle(x, y, r);
        }

        //! Fill a rectangle with an outside stroke
        public function strokeRectangle(dc, x, y, width, height, strokeWidth, fillColor, strokeColor) {
            // stroke
            setColor(dc, strokeColor);
            dc.fillRectangle(x - strokeWidth, y - strokeWidth, width + 2 * strokeWidth, height + 2 * strokeWidth);

            // fill
            setColor(dc, fillColor);
            dc.fillRectangle(x, y, width, height);
        }

        //! Fill a rectangle with an outside stroke around a point
        public function strokeRectangleCentered(dc, xCenter, yCenter, width, height, strokeWidth, fillColor, strokeColor) {
            // stroke
            setColor(dc, strokeColor);
            fillRectangleCentered(dc, xCenter, yCenter, width + 2 * strokeWidth, height);

            // fill
            setColor(dc, fillColor);
            fillRectangleCentered(dc, xCenter, yCenter, width, height);
        }

        // composite

        //! Draw lines at the edges of the device context
        public function drawBorders(dc) {
            resetColor(dc);
            dc.drawRectangle(0, 0, dc.getWidth(), dc.getHeight());
        }

        class BarBuilder {

            protected static const BAR_STROKE = 3;
            protected static const INDICATOR_STROKE = 2;

            public static const BAR_SMALL = 3;
            public static const BAR_MEDIUM = 7;
            public static const BAR_BIG = 11;

            protected static const INDICATOR_WIDTH = 3;
            protected static const INDICATOR_HEIGHT = 17;

            private var _bars;
            private var _indicators;

            //

            public function initialize() {
                _bars = [];
                _indicators = [];
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
                    setColor(dc, bar.color);
                    strokeRectangle(dc, bar.start, yCenter - bar.height / 2, bar.end - bar.start, bar.height, BAR_STROKE, bar.color, Graphene.COLOR_BLACK);
                }

                for (var i = 0; i < _indicators.size(); i++) {
                    var indicator = _indicators[i];
                    strokeRectangleCentered(dc, indicator.x, yCenter, INDICATOR_WIDTH, INDICATOR_HEIGHT, INDICATOR_STROKE, indicator.color, Graphene.COLOR_BLACK);
                }

            }

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
