using DevExpress.Spreadsheet;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UretimYonetimi.FR_Formlar.FR_06_Urun_Yonetimi.FR_06_01_Urun_Agaci_Kayit
{
    public partial class FR_06_01_01_Urun_Agaci_Kayit_Form : DevExpress.XtraEditors.XtraForm
    {
        public FR_06_01_01_Urun_Agaci_Kayit_Form()
        {
            InitializeComponent();
        }
        public class Bilgiler
        {
            public int SiraId { get; set; }
            public int ParentId { get; set; }
            public string SiraKodu { get; set; }
        }

        public int Kullanici { get; set; }
        public int sira { get; set; }
        public int uye { get; set; }
        UretimDataDataContext dc = new UretimDataDataContext();
        FN_Fonksiyonlar.FN_01_Mesajlar mesajlar = new FN_Fonksiyonlar.FN_01_Mesajlar();

        private void btnListele_Click(object sender, EventArgs e)
        {
            listView1.Items.Clear();
            List<Bilgiler> bilgiler1 = new List<Bilgiler>();
            IWorkbook workbook = spreadsheetControl1.Document;
            Worksheet worksheet = spreadsheetControl1.Document.Worksheets.ActiveWorksheet;
            Range range = spreadsheetControl1.Document.Worksheets[0].GetUsedRange();
            int rowCount = range.RowCount;
            for(int i = 0; i < rowCount; i++)
            {
                int ds = 0;
                sira = 1;
                string[] islemealinacak;
                islemealinacak = worksheet.Cells[i, 0].Value.ToString().Split('.', ',');
                string t1 = "";
                for(int k = 0; k < islemealinacak.Length; k++)
                {
                    t1 += islemealinacak[k] + " ";
                }
                string Parca_Kodu, Parca_Adi, Tanim, Birim, Miktar, Malz_Maliyet, Iscilik_Maliyeti, Genel_Maliyet;
                Parca_Kodu = worksheet.Cells[i, 2].Value.ToString();
                Parca_Adi= worksheet.Cells[i, 3].Value.ToString();
                Tanim= worksheet.Cells[i, 4].Value.ToString();
                Birim= worksheet.Cells[i, 5].Value.ToString();
                Miktar= worksheet.Cells[i, 6].Value.ToString();
                Malz_Maliyet = worksheet.Cells[i, 7].Value.ToString();
                Iscilik_Maliyeti = worksheet.Cells[i, 8].Value.ToString();
                Genel_Maliyet= worksheet.Cells[i, 9].Value.ToString();
                //
                //
                int boy = islemealinacak.Length;
                if (boy == 1)
                {
                    Bilgiler bilgiler = new Bilgiler();
                    bilgiler.ParentId = 0;
                    bilgiler.SiraId = uye;
                    bilgiler.SiraKodu = t1;
                    bilgiler1.Add(bilgiler);
                    //
                    //
                    listView1.Items.Add(new ListViewItem(new string[]
                    {
                        Convert.ToString(uye),
                        "0",
                        t1,
                        Parca_Kodu,
                        Parca_Adi,
                        Tanim,
                        Birim,
                        Miktar,
                        Malz_Maliyet,
                        Iscilik_Maliyeti,
                        Genel_Maliyet
                    }));
                    //
                    uye++;
                }
                else
                {
                    int yeniboyut = (islemealinacak.Length) - 1;
                    string[] yenidizi = new string[yeniboyut];
                    for(int k = 0; k < yeniboyut; k++)
                    {
                        yenidizi[k] = islemealinacak[k];
                    }
                    t1 = "";
                    for(int j = 0; j < yeniboyut; j++)
                    {
                        t1 += yenidizi[j] + " ";
                    }
                    string k1 = "";
                    for(int k = 0; k < islemealinacak.Length; k++)
                    {
                        k1 += islemealinacak[k] + " ";
                    }
                    var sor = bilgiler1.Where(x => x.SiraKodu == t1).FirstOrDefault();
                    Bilgiler bilgiler = new Bilgiler();
                    bilgiler.ParentId = sor.SiraId;
                    bilgiler.SiraId = uye;
                    bilgiler.SiraKodu = k1;
                    bilgiler1.Add(bilgiler);
                    //
                    // Listeye eklendi şimdi listviewe eklenecek
                    listView1.Items.Add(new ListViewItem(new string[]
                    {
                        Convert.ToString(uye),
                        sor.SiraId.ToString(),
                        k1,
                        Parca_Kodu,
                        Parca_Adi,
                        Tanim,
                        Birim,
                        Miktar,
                        Malz_Maliyet,
                        Iscilik_Maliyeti,
                        Genel_Maliyet
                    }));
                    //
                    uye += 1;
                }
                ds += 1;

            }

        }

        private void FR_06_01_01_Urun_Agaci_Kayit_Form_Load(object sender, EventArgs e)
        {
            uye = 1;
            sira = 1;
        }
    }
}
