using Toybox.Math;

module Carbon {

    //! The Footprint module provides extended position functionality
    (:Footprint :glance)
    module Footprint {

        // position, in radians
        public var lat = 0.0;
        public var lon = 0.0;

        // GET

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
            return 360 * Footprint.lat / Math.PI / 2;
        }

        //! Get longitude in degrees
        public function lonDeg() {
            return 360 * Footprint.lon / Math.PI / 2;
        }

        //

        //! Get last location while waiting for location event
        //! @param info Activity info
        public function getLastKnownLocation(info) {
            var pos = info.currentLocation;
            if (pos != null) {
                Footprint.lat = pos.toRadians()[0].toDouble();
                Footprint.lon = pos.toRadians()[1].toDouble();
            }
        }

        //! Location event listener delegation
        public function onPosition(info) {
            Footprint.lat = info.position.toRadians()[0].toDouble();
            Footprint.lon = info.position.toRadians()[1].toDouble();
        }

    }

}
