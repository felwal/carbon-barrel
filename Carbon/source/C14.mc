using Toybox.Time;

module Carbon {

    //! The Carbon-14 module provides extended date and time functionality
    (:C14 :glance)
    module C14 {

        public function secToMoment(sec) {
            var todaySec = Time.today().value();
            return new Time.Moment(todaySec + sec);
        }

        public function unixDays(moment) {
            var seconds = moment.value();
            return (seconds / Time.Gregorian.SECONDS_PER_DAY).toNumber();
        }

        // STRINGS

        //! Convert seconds to readable time string hh:mm:ss
        public function formatTime(secs) {
            var h = secs / 3600;
            var m = (secs % 3600) / 60;
            var s = secs % 60;
            var timeStr = h.format("%02d") + ":" + m.format("%02d") + ":" + s.format("%02d");
            return timeStr;
        }

        //! Convert info to readable time string hh:mm:ss
        public function formatInfo(info) {
            var timeStr = info.hour.format("%02d") + ":" + info.min.format("%02d") + ":" + info.sec.format("%02d");
            return timeStr;
        }

        //! Convert seconds to readable time string hh:mm
        public function formatTimeShort(secs) {
            var h = secs / 3600;
            var m = (secs % 3600) / 60;
            var timeStr = h.format("%02d") + ":" + m.format("%02d");
            return timeStr;
        }
    
    }

}
