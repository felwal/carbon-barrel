module Carbon {

    //! The Graphite module provides extended drawing functionality
    (:Graphite :glance)
    module Graphite {

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
                _bars.add([ xStart, xEnd, height, color ]);
            }

            public function addIndicator(x, color) {
                _indicators.add([ x, color ]);
            }

            public function build(dc) {
                var yCenter = dc.getHeight() / 2;

                for (var i = 0; i < _bars.size(); i++) {
                    var bar = _bars[i];
                    setColor(dc, bar[3]);
                    strokeRectangle(dc, bar[0], yCenter - bar[2] / 2, bar[1] - bar[0], bar[2], BAR_STROKE, bar[3], Graphene.COLOR_BLACK);
                }

                for (var i = 0; i < _indicators.size(); i++) {
                    var indicator = _indicators[i];
                    strokeRectangleCentered(dc, indicator[0], yCenter, INDICATOR_WIDTH, INDICATOR_HEIGHT, INDICATOR_STROKE, indicator[1], Graphene.COLOR_BLACK);
                }

            }

        }

    }

}
