$(function() {

    $('#btnCome').click(function() {
        var now = $('#clockTime').text();

        $('#comeTime').text(now);
        $(this).prop("disabled", true);

    });

    $('#btnLeave').click(function() {
        if ($('#btnCome').prop("disabled") == true) {
            var now = $('#clockTime').text();
            $('#leaveTime').text(now);
            $(this).prop("disabled", true);

            var cTime = $('#comeTime').text();
            var lTime = $('#leaveTime').text();
            var dayWorkTime = workTime(cTime, lTime);

            $('#dayWorkTime').text(dayWorkTime);

        } else {
            alert("출근을 하세요");
        }
    });



});

function Clock() {

    var now = new Date();

    var year = moment(now).format('YYYY');
    var month = moment(now).format('MM');
    var day = moment(now).format('DD');
    var weeknum = moment(now).format('d');
    var hour = moment(now).format('HH');
    var min = moment(now).format('mm');
    var sec = moment(now).format('ss');

    var week = ["일", "월", "화", "수", "목", "금", "토"];

    $('#clockDate').text(year + "-" + month + "-" + day + " (" + week[weeknum] + ")");
    $('#clockTime').text(hour + ":" + min + ":" + sec);

    setTimeout("Clock()", 1000);
}



function NowYD() {
    var ntime = new Date();

    var yd = moment(ntime).format('YYYY-MM');

    $('#nowYearMonth').text(yd);
}



function workTime(cTime, lTime) {
    /* var hour= ctime.substring(0,ctime.indexOf(":"));
    var time= ctime.substring(ctime.indexOf(":")+1,ctime.lastIndexOf(":"));
    var min= ctime.substring(ctime.lastIndexOf(":")+1); */

    lTime = "2021-01-01 " + lTime;
    cTime = "2021-01-01 " + cTime;

    var comeTime = new Date(cTime);
    var leaveTime = new Date(lTime);
    var dayWorkTime = new Date(leaveTime.getTime() - comeTime.getTime() + (1000 * 60 * 60 * 15));

    dayWorkTime = moment(dayWorkTime).format("HH:mm:ss");

    return dayWorkTime;
}


var nowDates = new Date();
window.onload = function() {
    Clock();
    NowYD();
}