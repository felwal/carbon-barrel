using Toybox.Math;
using Carbon.Chem as Chem;

module Carbon {

    //! The Footprint module provides extended position functionality
    (:Footprint :glance)
    module Footprint {

        // position, in radians
        public var lat = 0.0;
        public var lon = 0.0;

        // get

        //! Get latitude in radians
        public function latRad() {
            return lat;
        }

        //! Get longitude in radians
        public function lonRad() {
            return lon;
        }

        //! Get latitude in degrees
        public function latDeg() {
            return Chem.deg(lat);
        }

        //! Get longitude in degrees
        public function lonDeg() {
            return Chem.deg(lon);
        }

        //

        //! Get last location while waiting for location event
        //! @param info Activity info
        public function getLastKnownLocation(info) {
            var pos = info.currentLocation;
            if (pos != null) {
                lat = pos.toRadians()[0].toDouble();
                lon = pos.toRadians()[1].toDouble();
            }
        }

        //! Location event listener delegation
        public function onPosition(info) {
            lat = info.position.toRadians()[0].toDouble();
            lon = info.position.toRadians()[1].toDouble();
        }

    }

}
