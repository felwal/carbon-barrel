using Toybox.Math;

module Carbon {

    //! The Chemistry module provides extended math functionality
    (:Chem :glance)
    module Chem {

        public const TAU = 6.28318530717958647692;

        // geometry

        //! Get carteesian coordinates from polar coordinates
        //! @param angle The argument of the position, in radians
        //! @param x0, y0 The x- and y-coordinates of the center
        public function polarPos(amp, angle, x0, y0) {
            var x = amp * Math.cos(angle) + x0;
            // multiply by -1 to handle screen y increase downwards
            var y = -1 * amp * Math.sin(angle) + y0;
            return [x, y];
        }

        //! Calculate the leftmost x-coordinate of a circular screen at a specific y
        public function minX(y, r) {
            if (y < 0 || y > 2 * r) {
                return null;
            }
            return -Math.sqrt(Math.pow(r, 2) - Math.pow(y - r, 2)) + r;
        }

        //! Calculate the rightmost x-coordinate of a circular screen at a specific y
        public function maxX(y, r) {
            if (y < 0 || y > 2 * r) {
                return null;
            }
            return Math.sqrt(Math.pow(r, 2) - Math.pow(y - r, 2)) + r;
        }

        public function deg(rad) {
            return 360 * rad / TAU;
        }

        public function rad(deg) {
            return TAU * deg / 360;
        }

        // misc

        public function min(a, b) {
            return a <= b ? a : b;
        }

        public function max(a, b) {
            return a >= b ? a : b;
        }

        public function coerceIn(value, min, max) {
            return min > max ? null : (value < min ? min : (value > max ? max : value));
        }

        public function abs(x) {
            return x < 0 ? -x : x;
        }

        //! The Monkey C modulo operator uses truncated division, which gives the remainder with same sign as the dividend.
        //! This uses floored division, which gives the remainder with same sign as the divisor.
        public function mod(dividend, divisor) {
            var quotient = Math.floor(dividend.toFloat() / divisor.toFloat()).toNumber();
            var remainder = dividend - divisor * quotient;
            return remainder;
        }

    }

}
