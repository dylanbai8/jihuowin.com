// 点击选中 span需要设置id
$(function(){
    $("span").on("click", function(){
        var selection = window.getSelection();
        selection.removeAllRanges();
        var range = document.createRange();
        range.selectNodeContents(document.getElementById($(this).attr('id')));
        selection.addRange(range);
    })
})
