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

// 复制span到剪贴板
function copyToClipboard() {
  // 1. 获取所有 span 元素
  const spans = document.querySelectorAll('span');

  // 2. 为每个 span 元素添加点击事件
  spans.forEach(span => {
    span.addEventListener('click', () => {
      // 将 span 内容复制到剪贴板
      const text = span.innerText;
      navigator.clipboard.writeText(text).then(() => {
        // 显示 "复制成功" 提示
        showTooltip(span, "复制成功");
      }).catch(err => {
        console.error("复制失败", err);
      });
    });
  });
}

function showTooltip(element, message) {
  // 创建提示元素
  const tooltip = document.createElement('div');
  tooltip.innerText = message;
  tooltip.style.position = 'absolute';
  tooltip.style.backgroundColor = 'rgba(0, 0, 0, 0.7)';
  tooltip.style.color = '#fff';
  tooltip.style.padding = '5px 10px';
  tooltip.style.borderRadius = '5px';
  tooltip.style.fontSize = '14px';
  tooltip.style.whiteSpace = 'nowrap';
  tooltip.style.pointerEvents = 'none';
  tooltip.style.transition = 'opacity 0.3s';
  tooltip.style.opacity = '0';

  // 添加到文档中并定位
  document.body.appendChild(tooltip);
  const rect = element.getBoundingClientRect();
  tooltip.style.left = `${rect.left + window.pageXOffset}px`;
  tooltip.style.top = `${rect.top + window.pageYOffset - 30}px`;

  // 显示提示
  setTimeout(() => tooltip.style.opacity = '1', 10);

  // 3秒后隐藏并移除提示
  setTimeout(() => {
    tooltip.style.opacity = '0';
    setTimeout(() => tooltip.remove(), 300);
  }, 3000);
}

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', copyToClipboard);

