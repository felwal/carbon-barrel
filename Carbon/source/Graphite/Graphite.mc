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

    }

}
