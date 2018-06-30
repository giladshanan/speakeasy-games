$(document).ready(function() {
  $('.local_time').each(function(_a, elem) {
    time = Date.parse($(elem).attr('datetime'))
    localTime = moment(time).format('M/D/YYYY h:mm A')
    $(elem).text(localTime);
  });
});
