a=0;
nombre_de_champ=0;
$('.nombre').change(calculTotal());

function calculTotal(){
    //on cherche le nombre de champ
    while(!isNaN($('.nombre').eq(a).val())){
        nombre_de_champ++;
        a++;
    }

    //On addition les champ non vide

    somme_total=0;
    for(i=0;i<nombre_de_champ;i++){
        if($('.nombre').eq(i).val()=="" || $('.nombre').eq(i).val()=="0"){
            continue;
        }
        else{
            tmp=parseInt($('.nbr_hid').eq(i).val());
            somme_total+=(parseInt($('.nombre').eq(i).val())*(tmp));
        }
    }

    $('#montant_total').text(somme_total);
    $('#montant_paye').text($('#avance').val());
    $('#reste').text(somme_total-parseInt($('#avance').val()));
}