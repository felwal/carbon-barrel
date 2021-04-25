using Toybox.Graphics;

module Carbon {

    // The Graphite module provides extended drawing functionality.
    (:Graphite :glance)
    module Graphite {

        public const STROKE = 2;

        // COLORS

        //! Set the current foreground color
        public function setColor(dc, foreground) {
            dc.setColor(foreground, Graphics.COLOR_BLACK);
        }

        //! Set the current fg and bg colors to white and black
        public function resetColor(dc) {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        }

        // PRIMITIVE

        //! Fill a rectangle around a point
        public function fillRectangleCentered(dc, xCenter, yCenter, width, height) {
            dc.fillRectangle(xCenter - width / 2, yCenter - height / 2, width, height);
        }

        // STROKE

        //! Fill a circle with an outside stroke
        public function strokeCircle(dc, x, y, r, strokeWidth, fillColor, strokeColor) {
            // stroke
            dc.setColor(strokeColor, Graphics.COLOR_BLACK);
            dc.fillCircle(x, y, r + strokeWidth);

            // fill
            dc.setColor(fillColor, Graphics.COLOR_BLACK);
            dc.fillCircle(x, y, r);
        }

        //! Fill a rectangle with an outside stroke
        public function strokeRectangle(dc, x, y, width, height, strokeWidth, fillColor, strokeColor) {
            // stroke
            dc.setColor(strokeColor, Graphics.COLOR_BLACK);
            dc.fillRectangle(x - strokeWidth, y - strokeWidth, width + 2 * strokeWidth, height + 2 * strokeWidth);

            // fill
            dc.setColor(fillColor, Graphics.COLOR_BLACK);
            dc.fillRectangle(x, y, width, height);
        }

        //! Fill a rectangle with an outside stroke around a point
        public function strokeRectangleCentered(dc, xCenter, yCenter, width, height, strokeWidth, fillColor, strokeColor) {
            // stroke
            dc.setColor(strokeColor, Graphics.COLOR_BLACK);
            fillRectangleCentered(dc, xCenter, yCenter, width + 2 * strokeWidth, height);

            // fill
            dc.setColor(fillColor, Graphics.COLOR_BLACK);
            fillRectangleCentered(dc, xCenter, yCenter, width, height);
        }

        // COMPOSITE

        //! Draw lines at the edges of the device context
        public function drawBorders(dc) {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            dc.drawRectangle(0, 0, dc.getWidth(), dc.getHeight());
        }

    }

}
