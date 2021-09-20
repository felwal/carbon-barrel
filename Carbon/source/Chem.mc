using Toybox.Math;

module Carbon {

    //! The Chemistry module provides extended math functionality
    (:Chem :glance)
    module Chem {

        public const TAU = 2 * Math.PI;

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

        //! Calculate the leftmost x-coordinate of a circular screen
        public function minX(y, r) {
            if (y < 0 || y > 2 * r) {
                return null;
            }
            return -Math.sqrt(Math.pow(r, 2) - Math.pow(y - r, 2)) + r;
        }

        //! Calculate the leftmost x-coordinate of a circular screen
        public function maxX(y, r) {
            if (y < 0 || y > 2 * r) {
                return null;
            }
            return Math.sqrt(Math.pow(r, 2) - Math.pow(y - r, 2)) + r;
        }

        //! Convert radians to degrees
        public function deg(rad) {
            return 360 * rad / TAU;
        }

        //! Convert degrees to radians
        public function rad(deg) {
            return TAU * deg / 360;
        }

        // misc

        //! Calculate the smallest of two values
        public function min(a, b) {
            return a <= b ? a : b;
        }

        // Calculate the absolute value of a value
        public function abs(x) {
            return x < 0 ? -x : x;
        }

    }

}
