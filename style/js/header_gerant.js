let b=false;
$('.menu_dote').click(function(){
    if(b){
        $('.icone_zone').slideUp(1000);
        $('.menu_dote i').attr('class', 'fas fa-bars');
        $('.menu_dote i').css('color', 'green');
        b=false;
    }
    else{
        $('.icone_zone').slideDown(1000);
        $('.icone_zone').css('display', 'flex');
        $('.menu_dote i').attr('class', 'fa fa-window-close');
        $('.menu_dote i').css('color', 'red');
        b=true;
    }
})