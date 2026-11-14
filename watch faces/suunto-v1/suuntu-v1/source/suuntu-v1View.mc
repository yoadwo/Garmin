import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.WatchUi;

class suuntu_v1View extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;

        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            } else if (hours == 0) {
                hours = 12;
            }
        }

        var hourColor = Application.Properties.getValue("ForegroundColor") as Lang.Number;
        var dateInfo = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateLabel = View.findDrawableById("DateLabel") as Text;
        var hourLabel = View.findDrawableById("HourLabel") as Text;
        var minuteLabel = View.findDrawableById("MinuteLabel") as Text;
        var batteryLabel = View.findDrawableById("BatteryLabel") as Text;
        dateLabel.setText(Lang.format("$1$ $2$ $3$", [
            dateInfo.day_of_week,
            dateInfo.month,
            dateInfo.day
        ]).toUpper());
        hourLabel.setText(hours.format("%02d"));
        hourLabel.setColor(hourColor);
        minuteLabel.setText(clockTime.min.format("%02d"));
        batteryLabel.setText(Lang.format("$1$%", [
            System.getSystemStats().battery.format("%.0f")
        ]));

        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
