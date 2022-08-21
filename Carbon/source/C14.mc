using Toybox.System;
using Toybox.Time;

module Carbon {

    //! The Carbon-14 module provides extended date and time functionality
    (:C14 :glance)
    module C14 {

        public function now() {
            return new Time.Moment(Time.now().value());
        }

        public function secToMoment(sec) {
            var todaySec = Time.today().value();
            return new Time.Moment(todaySec + sec);
        }

        public function unixDays(moment) {
            var seconds = moment.value();
            return (seconds / Time.Gregorian.SECONDS_PER_DAY).toNumber();
        }

        //! Convert String on the format "YYYY-MM-DDThh:mm:ss" to Moment
        public function iso8601StrToMoment(str) {
            if (str == null || str.length() != 19) {
                //Log.d(str + " not of ISO8601 (\"YYYY-MM-DDThh:mm:ss\")");
                return null;
            }

            var year = str.substring(0, 4).toNumber();
            var month = str.substring(5, 7).toNumber();
            var day = str.substring(8, 10).toNumber();
            var hour = str.substring(11, 13).toNumber();
            var minute = str.substring(14, 16).toNumber();
            var second = str.substring(17, 19).toNumber();

            var options = {
                :year => year,
                :month => month,
                :day => day,
                :hour => hour,
                :minute => minute,
                :second => second
            };

            return Time.Gregorian.moment(options);
        }

        public function localIso8601StrToMoment(str) {
            var moment = C14.iso8601StrToMoment(str);

            if (moment != null) {
                // subtract timezone offset
                var utcOffsetSec = System.getClockTime().timeZoneOffset;
                var utcOffsetDur = new Time.Duration(utcOffsetSec);
                moment = moment.subtract(utcOffsetDur);
            }

            return moment;
        }

        // string

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
