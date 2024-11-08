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

function copySpanContent() {
    document.querySelectorAll('span').forEach(span => {
        span.addEventListener('click', function() {
            // 创建一个临时的input元素，用于选中和复制内容
            const tempInput = document.createElement('input');
            tempInput.value = this.textContent;
            document.body.appendChild(tempInput);

            // 选中内容并复制到剪贴板
            tempInput.select();
            document.execCommand('copy');

            // 移除临时input元素
            document.body.removeChild(tempInput);

            // 可选：提示复制成功
            alert('内容已复制到剪贴板');
        });
    });
}

// 调用函数以绑定点击事件
copySpanContent();

