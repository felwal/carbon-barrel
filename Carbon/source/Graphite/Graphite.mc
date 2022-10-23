using Toybox.WatchUi;
using Toybox.Math;
using Toybox.Graphics;
using Carbon.Chem;

module Carbon {

    //! The Graphite module provides extended drawing functionality
    (:Graphite :glance)
    module Graphite {

        // tool

        public function getCenterX(dc) {
            return dc.getWidth() / 2;
        }

        public function getCenterY(dc) {
            return dc.getHeight() / 2;
        }

        public function getRadius(dc) {
            return (dc.getWidth() + dc.getHeight()) / 4;
        }

        public function pxToRad(px, r) {
            return px.toFloat() / r;
        }

        public function pxToDeg(px, r) {
            return Chem.deg(pxToRad(px, r));
        }

        // color

        //! Set the current foreground color
        public function setColor(dc, foreground) {
            dc.setColor(foreground, Graphene.COLOR_BLACK);
        }

        //! Set the current fg and bg colors to white and black
        public function resetColor(dc) {
            dc.setColor(Graphene.COLOR_WHITE, Graphene.COLOR_BLACK);
        }

        public function resetPenWidth(dc) {
            dc.setPenWidth(1);
        }

        // draw shape

        public function drawArcCentered(dc, edgeOffset, degreeStart, degreeEnd) {
            dc.drawArc(getCenterX(dc), getCenterY(dc), getRadius(dc) - edgeOffset, Graphics.ARC_COUNTER_CLOCKWISE, degreeStart, degreeEnd);
        }

        // fill shape

        public function fillBackground(dc, color) {
            setColor(dc, color);
            fillRectangleCentered(dc, getCenterX(dc), getCenterY(dc), dc.getWidth(), dc.getHeight());
        }

        //! Fill a rectangle around a point
        public function fillRectangleCentered(dc, xCenter, yCenter, width, height) {
            dc.fillRectangle(xCenter - width / 2, yCenter - height / 2, width, height);
        }

        // stroke shape

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

        public function strokeArcCentered(dc, edgeOffset, width, strokeWidth, degreeStart, degreeEnd, color, strokeColor) {
            var x = getCenterX(dc);
            var y = getCenterY(dc);
            var r = getRadius(dc) - edgeOffset;

            degreeStart = Math.floor(degreeStart);
            degreeEnd = Math.ceil(degreeEnd);

            var strokeDegreeOffset = Math.ceil(pxToDeg(strokeWidth, getRadius(dc)));
            var strokeDegreeStart = degreeStart - strokeDegreeOffset;
            var strokeDegreeEnd = degreeEnd + strokeDegreeOffset;
            var attr = Graphics.ARC_COUNTER_CLOCKWISE;

            // stroke
            setColor(dc, strokeColor);
            dc.setPenWidth(width + 2 * strokeWidth);
            dc.drawArc(x, y, r, attr, strokeDegreeStart, strokeDegreeEnd);

            // draw
            setColor(dc, color);
            dc.setPenWidth(width);
            dc.drawArc(x, y, r, attr, degreeStart, degreeEnd);

            resetPenWidth(dc);
        }

        // text

        public function drawTextArea(dc, x, y, w, h, fonts, text, justification, color) {
            // compute location depending on justification, to match how `Dc#drawText` behaves
            var locX = justification&Graphics.TEXT_JUSTIFY_CENTER
                ? x - w / 2
                : (justification&Graphics.TEXT_JUSTIFY_RIGHT ? x - w : x);
            var locY = justification&Graphics.TEXT_JUSTIFY_VCENTER ? y - h / 2 : y;

            var textArea = new WatchUi.TextArea({
                :text => text,
                :color => color,
                :font => fonts,
                :locX => locX,
                :locY => locY,
                :width => w,
                :height => h,
                :justification => justification
            });

            textArea.draw(dc);
        }

    }

}
