# 设置错误处理偏好为 "SilentlyContinue"，即忽略错误并继续执行。
$ErrorActionPreference = "SilentlyContinue"
# 为了兼容旧的客户端，启用 TLSv1.2 协议。
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# 加载必要的.NET Framework程序集
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# 创建主窗体
$form = New-Object System.Windows.Forms.Form
$form.Text = "【打赏】维护不易 求赞助 :)"
$form.Size = New-Object System.Drawing.Size(315, 390)
$form.StartPosition = "CenterScreen"

# 隐藏窗体的最大化、最小化按钮、任务栏，并设置窗体为顶层
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.ShowInTaskbar = $false
$form.TopMost = $true

# 添加FormClosing事件处理器
$form.add_FormClosing({
    # 弹出确认对话框
    $result = [System.Windows.Forms.MessageBox]::Show("雕虫小技，感谢支持！`r`n`r`n我已打赏，请点 是。考虑考虑，请点 否。", "打赏一点嘛 :(", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::None)
    # 如果用户点击了"否"，则取消关闭
    if ($result -eq [System.Windows.Forms.DialogResult]::No) {
        $_.Cancel = $true
    }
})

# 创建PictureBox控件来显示图片
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$pictureBox.Location = New-Object System.Drawing.Point(0, 0)
$pictureBox.Size = New-Object System.Drawing.Size(300, 300)

# 图片
$pictureBox.Image = [System.Drawing.Image]::FromFile("$Env:temp\donate300.png")

# 创建一个按钮，名称为“我已打赏”
$button = New-Object System.Windows.Forms.Button
$button.Text = "我 已 打 赏"
$button.Location = New-Object System.Drawing.Point(100, 310)
$button.Size = New-Object System.Drawing.Size(100, 30)

# 设置按钮样式
$button.BackColor = [System.Drawing.Color]::FromArgb(255, 100, 149, 237)  # 背景色 (Cornflower Blue)
$button.ForeColor = [System.Drawing.Color]::White                        # 字体颜色
$button.Font = New-Object System.Drawing.Font("Microsoft YaHei", 10, [System.Drawing.FontStyle]::Bold)  # 字体和大小
$button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat               # 设置为扁平风格
$button.FlatAppearance.BorderSize = 0                                    # 移除边框
$button.Cursor = [System.Windows.Forms.Cursors]::Hand                    # 设置鼠标悬停时的光标样式

# 添加按钮点击事件处理程序，点击后关闭窗体
$button.Add_Click({
    $form.Close()
})

# 将控件添加到窗体上
$form.Controls.Add($pictureBox)
$form.Controls.Add($button)

# 显示窗体
[void]$form.ShowDialog()

