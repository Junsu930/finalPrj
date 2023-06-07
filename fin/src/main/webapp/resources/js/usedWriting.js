$('#usedTitlePlace').keyup(function(e){
    
    let cont = $(this).val();

    if(cont.length == 0 || cont == ''){
        $('#usedTitleInputTextLength').text('0/40');
    }else{
        $('#usedTitleInputTextLength').text(cont.length + '/40');
    }
})


$('#usedDetailExplain').keyup(e=>{

    let textCont = $(e.target).val();

    if(textCont.length == 0 || textCont == ''){
        $('#detailExplainTextAmount').html('0 / 4000');
    }else{
        $('#detailExplainTextAmount').html(textCont.length+' / 4000');
    }

    if(textCont.length > 4000) {
        $(e.target).val($(e.target).val().substring(0, 4000));
        $('#detailExplainTextAmount').html('4000 / 4000');
    }

})