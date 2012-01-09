$(function() {
  showTime();
  $('#topbar').dropdown();
  $('.should_popover').popover();
  $(".alert-message").alert();
})

function getNowTime(objD)
{
  var hour = objD.getHours();
  if (hour < 10) {
    hour = '0' + hour;
  }

  var minute = objD.getMinutes();
  if (minute < 10) {
    minute = '0' + minute;
  }

  var second = objD.getSeconds();
  if (second < 10) {
    second = '0' + second;
  }

  return (hour + ":" + minute + ":" + second);
}
function showTime()
{
  var today = new Date();
  $("#timespan").html(getNowTime(today));
  window.setTimeout("showTime()", 1000);
}