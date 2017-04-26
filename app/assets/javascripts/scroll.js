var height = 0;
$("div.message-user").each(function(i, value){
    height += parseInt($(this).height());
});

height += '';

$('div').animate({scrollTop: height});
