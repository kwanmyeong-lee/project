$(function() {

    $(document).on("click","#btnCome",function(){
		var now = $('#clockTime').text();
		var ymd= new Date();
		ymd= moment(ymd).format("YYYY-MM-DD");
		
		var attendanceDayRegdate = ymd;
		var empNo = $('.empNo').val();
		var attendanceDayOnHour = ymd+" "+now

		$.ajax({    
            type:'get',
            url:"insertComTime",
            data:{empNo:empNo, attendanceDayOnHour:attendanceDayOnHour,
            	attendanceDayRegdate:attendanceDayRegdate},
            dataType: "json",
            success : function(data) {
 
        		$('#comeTime').text(now);
        		$('#btnCome').prop("disabled",true);
            }
          });
		
		
		
	});
		
	$(document).on("click","#btnLeave",function(){
		if($('#btnCome').prop("disabled")==true){
			var now = $('#clockTime').text();
			var cTime = $('#comeTime').text();
			var dayWorkTime=workTime(cTime,now);
			
			var ymd= new Date();
			ymd= moment(ymd).format("YYYY-MM-DD");
			
			var attendanceDayOffHour = ymd+" "+now;
			var empNo = $('.empNo').val();
			var attendanceDayWorkHour = ymd+" "+dayWorkTime;
			var attendanceDayRegdate = ymd;
			var attendanceDayOnHour = ymd+" "+cTime;
			
			$.ajax({    
	            type:'get',
	            url:"updateLeaveTime",
	            data:{empNo:empNo, attendanceDayOffHour:attendanceDayOffHour,
	            	attendanceDayWorkHour:attendanceDayWorkHour,
	            	attendanceDayRegdate:attendanceDayRegdate,
	            	attendanceDayOnHour:attendanceDayOnHour
	            },
	            dataType: "json",
	            success : function(data) {
	            	
	            	$('#leaveTime').text(now);
	    			$('#btnLeave').prop("disabled",true);
	    			$('#dayWorkTime').text(dayWorkTime);
	            }
	          });
			
		}else{
			swal("출근을 해야합니다" ,  "" ,  "error" );
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
