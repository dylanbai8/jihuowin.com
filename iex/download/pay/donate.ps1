# ���ô�����ƫ��Ϊ "SilentlyContinue"�������Դ��󲢼���ִ�С�
$ErrorActionPreference = "SilentlyContinue"
# Ϊ�˼��ݾɵĿͻ��ˣ����� TLSv1.2 Э�顣
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# ���ر�Ҫ��.NET Framework����
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ����������
$form = New-Object System.Windows.Forms.Form
$form.Text = "�����͡�ά������ ������ :)"
$form.Size = New-Object System.Drawing.Size(315, 390)
$form.StartPosition = "CenterScreen"

# ���ش������󻯡���С����ť���������������ô���Ϊ����
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.ShowInTaskbar = $false
$form.TopMost = $true

# ���FormClosing�¼�������
$form.add_FormClosing({
    # ����ȷ�϶Ի���
    $result = [System.Windows.Forms.MessageBox]::Show("���С������л֧�֣�`r`n`r`n���Ѵ��ͣ���� �ǡ����ǿ��ǣ���� ��", "����һ���� :(", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::None)
    # ����û������"��"����ȡ���ر�
    if ($result -eq [System.Windows.Forms.DialogResult]::No) {
        $_.Cancel = $true
    }
})

# ����PictureBox�ؼ�����ʾͼƬ
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$pictureBox.Location = New-Object System.Drawing.Point(0, 0)
$pictureBox.Size = New-Object System.Drawing.Size(300, 300)

# ͼƬ
$pictureBox.Image = [System.Drawing.Image]::FromFile("$Env:temp\donate300.png")

# ����һ����ť������Ϊ�����Ѵ��͡�
$button = New-Object System.Windows.Forms.Button
$button.Text = "�� �� �� ��"
$button.Location = New-Object System.Drawing.Point(100, 310)
$button.Size = New-Object System.Drawing.Size(100, 30)

# ���ð�ť��ʽ
$button.BackColor = [System.Drawing.Color]::FromArgb(255, 100, 149, 237)  # ����ɫ (Cornflower Blue)
$button.ForeColor = [System.Drawing.Color]::White                        # ������ɫ
$button.Font = New-Object System.Drawing.Font("Microsoft YaHei", 10, [System.Drawing.FontStyle]::Bold)  # ����ʹ�С
$button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat               # ����Ϊ��ƽ���
$button.FlatAppearance.BorderSize = 0                                    # �Ƴ��߿�
$button.Cursor = [System.Windows.Forms.Cursors]::Hand                    # ���������ͣʱ�Ĺ����ʽ

# ��Ӱ�ť����¼�������򣬵����رմ���
$button.Add_Click({
    $form.Close()
})

# ���ؼ���ӵ�������
$form.Controls.Add($pictureBox)
$form.Controls.Add($button)

# ��ʾ����
[void]$form.ShowDialog()

