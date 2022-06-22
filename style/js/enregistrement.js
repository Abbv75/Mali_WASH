i=3;

function ajoutVetement(){
    let test="<div class=\"vetement_zone\" id=\"vetement_zone1\"><select name=\"habit"+(++i)+"\" id=\"\"><option value=\"Costume\" >Costume</option></select><span></span><input type=\"number\" id=\"nombre\" class=\"nombre\" onchange=\"ajoutVetement()\" value=\""+(++i)+"\" name=\"testnombre"+(++i)+"\" required></div>";
    let t=[1,2,3];
    if($('.nombre:last').val()!='0'){          
        /* $.ajax({
            method: 'GET',
            statusCode:'200',
            url:"test.php?habit1=Costume&testnombre=45;y",
            success : function (response) {
                alert(response);
            }
        }) */
        $('.vetement_form').html($('.vetement_form').html()+test);
    }
    else{
        
    }
}

function addComponent(){

}
