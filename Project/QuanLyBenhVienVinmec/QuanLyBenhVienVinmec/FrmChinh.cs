using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBenhVienVinmec
{
    public partial class FrmChinh : Form
    {
        public FrmChinh()
        {
            InitializeComponent();
        }
        private Form currentFromChild;
        private void OpenChildForm(Form ChildForm)
        {
            if (currentFromChild != null)
            {
                currentFromChild.Close();
            }
            currentFromChild = ChildForm;
            ChildForm.TopLevel = false;
            ChildForm.FormBorderStyle = FormBorderStyle.None;
            ChildForm.Dock = DockStyle.Fill;
            panel_Body.Controls.Add(ChildForm);
            panel_Body.Tag = ChildForm;
            ChildForm.BringToFront();
            ChildForm.Show();
        }

        private void btnTrangChu_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FrmTrangChu());
        }

        private void btnGioiThieu_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FrmGioiThieu());
        }

        private void btnLienHe_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FrmLienHe());
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FrmDangNhap());
        }

        private void FrmChinh_Load(object sender, EventArgs e)
        {
        }

        private void panel_Body_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }
    }
}
