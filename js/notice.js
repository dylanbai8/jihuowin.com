// 创建并显示弹框公告
function showAnnouncement(content, width, bgColor) {
    // 创建公告元素
    var announcement = document.createElement('div');
    announcement.style.position = 'fixed';
    announcement.style.bottom = '10px';
    announcement.style.right = '10px';
    announcement.style.width = width;
    announcement.style.backgroundColor = bgColor;
    announcement.style.color = 'white';
    announcement.style.padding = '10px';
    announcement.style.borderRadius = '1px';
    announcement.style.boxShadow = '0 0 10px rgba(0, 0, 0, 0.5)';
    announcement.style.zIndex = '10000';
    announcement.style.opacity = '0.9';
    announcement.style.textAlign = 'left';
    announcement.style.fontSize = '13px';

    // 创建关闭按钮
    var closeButton = document.createElement('div');
    closeButton.innerHTML = 'x';
    closeButton.style.position = 'absolute';
    closeButton.style.top = '0px';
    closeButton.style.right = '5px';
    closeButton.style.cursor = 'pointer';
    closeButton.style.color = 'white';
    closeButton.style.fontWeight = 'lighter';
    closeButton.onclick = function() {
        announcement.style.display = 'none';
    };

    // 创建公告内容
    var contentDiv = document.createElement('div');
    contentDiv.innerHTML = content;

    // 将关闭按钮和内容添加到公告元素中
    announcement.appendChild(closeButton);
    announcement.appendChild(contentDiv);

    // 将公告元素添加到页面中
    document.body.appendChild(announcement);
}
