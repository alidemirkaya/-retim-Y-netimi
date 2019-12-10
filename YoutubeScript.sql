/****** Object:  Table [dbo].[TBL_Stok]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Stok](
	[s_Record] [bigint] IDENTITY(1,1) NOT NULL,
	[s_iptal] [bit] NULL,
	[s_Kayit_Tarih] [date] NULL,
	[s_Kayit_Kullanici] [int] NULL,
	[s_Guncelleme] [bit] NULL,
	[s_Guncelleme_kullanici] [int] NULL,
	[s_Guncelleme_Tarih] [date] NULL,
	[s_StokKod] [nvarchar](25) NULL,
	[s_StokAdi] [nvarchar](50) NULL,
	[s_Stok_Kisa_ismi] [nvarchar](25) NULL,
	[s_Stok_Grup_Kodu] [nvarchar](25) NULL,
	[s_Cari_Kodu] [nvarchar](25) NULL,
	[s_Stok_Cinsi] [tinyint] NULL,
	[s_birim1_ad] [nvarchar](10) NULL,
	[s_birim1_katsayi] [float] NULL,
	[s_birim1_agirlik] [float] NULL,
	[s_birim1_en] [float] NULL,
	[s_birim1_boy] [float] NULL,
	[s_birim1_yuksekliik] [float] NULL,
	[s_birim2_ad] [nvarchar](10) NULL,
	[s_birim2_katsayi] [float] NULL,
	[s_birim2_agirlik] [float] NULL,
	[s_birim2_en] [float] NULL,
	[s_birim2_boy] [float] NULL,
	[s_birim2_yuksekliik] [float] NULL,
	[s_birim3_ad] [nvarchar](10) NULL,
	[s_birim3_katsayi] [float] NULL,
	[s_birim3_agirlik] [float] NULL,
	[s_birim3_en] [float] NULL,
	[s_birim3_boy] [float] NULL,
	[s_birim3_yuksekliik] [float] NULL,
	[s_Stok_Min_seviye] [float] NULL,
	[s_Stok_Siparis_seviye] [float] NULL,
	[s_Stok_Max] [float] NULL,
	[s_Stok_ver_sip_birim] [tinyint] NULL,
	[s_Stok_al_sip_birim] [tinyint] NULL,
	[s_Stok_sip_sure] [smallint] NULL,
	[s_Stok_Garanti_Suresi] [smallint] NULL,
 CONSTRAINT [PK_TBL_Stok] PRIMARY KEY CLUSTERED 
(
	[s_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Stok_Hareketleri]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Stok_Hareketleri](
	[sth_Record] [bigint] IDENTITY(1,1) NOT NULL,
	[sth_Kayit_Kullanici] [int] NULL,
	[sth_Kayit_Tarih] [date] NULL,
	[sth_Hareket_Tipi] [tinyint] NULL,
	[sth_Stok_Kayit] [bigint] NULL,
	[sth_Stok_Kod] [nvarchar](25) NULL,
	[sth_Masraf1] [float] NULL,
	[sth_Masraf2] [float] NULL,
	[sth_Masraf3] [float] NULL,
	[sth_Miktar] [float] NULL,
	[sth_Toplam] [float] NULL,
 CONSTRAINT [PK_TBL_Stok_Hareketleri] PRIMARY KEY CLUSTERED 
(
	[sth_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_StokHareketler]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_StokHareketler]
AS
SELECT dbo.TBL_Stok_Hareketleri.sth_Record, dbo.TBL_Stok.s_StokKod, dbo.TBL_Stok.s_Record, dbo.TBL_Stok.s_StokAdi, dbo.TBL_Stok.s_Stok_Kisa_ismi, dbo.TBL_Stok.s_Stok_Grup_Kodu, dbo.TBL_Stok.s_Cari_Kodu, 
                  dbo.TBL_Stok.s_Stok_Cinsi, dbo.TBL_Stok.s_Stok_Min_seviye, dbo.TBL_Stok.s_Stok_Siparis_seviye, dbo.TBL_Stok.s_Stok_Max, dbo.TBL_Stok.s_Stok_al_sip_birim, dbo.TBL_Stok.s_Stok_Garanti_Suresi, dbo.TBL_Stok.s_Stok_sip_sure, 
                  dbo.TBL_Stok.s_Stok_ver_sip_birim, dbo.TBL_Stok_Hareketleri.sth_Masraf2, dbo.TBL_Stok_Hareketleri.sth_Masraf1, dbo.TBL_Stok_Hareketleri.sth_Masraf3, dbo.TBL_Stok_Hareketleri.sth_Miktar, dbo.TBL_Stok_Hareketleri.sth_Toplam, 
                  dbo.TBL_Stok_Hareketleri.sth_Hareket_Tipi
FROM     dbo.TBL_Stok INNER JOIN
                  dbo.TBL_Stok_Hareketleri ON dbo.TBL_Stok.s_Record = dbo.TBL_Stok_Hareketleri.sth_Stok_Kayit
GO
/****** Object:  Table [dbo].[TBL_AnaUrunler]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_AnaUrunler](
	[m_Record] [int] IDENTITY(1,1) NOT NULL,
	[m_iptal] [bit] NULL,
	[m_Guncelleme] [nchar](10) NULL,
	[m_Olusturan_Kullanici] [int] NULL,
	[m_Olusturulma_Tarihi] [datetime] NULL,
	[m_Son_Guncelleyen_Kullanici] [int] NULL,
	[m_Son_Guncelleme_Tarihi] [datetime] NULL,
	[Ana_Urun_Kodu] [varchar](100) NULL,
	[Ana_Urun_Adi] [varchar](500) NULL,
	[Aciklama] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CariHareketleri]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CariHareketleri](
	[c_Record] [bigint] IDENTITY(1,1) NOT NULL,
	[c_Guncelleme] [bit] NULL,
	[c_Guncelleme_Tarih] [date] NULL,
	[c_Guncelleme_Kullanici] [int] NULL,
	[c_Kayit_Tarih] [date] NULL,
	[c_Kayit_Kullanici] [int] NULL,
	[c_Firma_No] [int] NULL,
	[c_Sube_No] [int] NULL,
	[c_Evrak_Kodu] [varchar](50) NULL,
	[c_Evrak_Seri_No] [nvarchar](20) NULL,
	[c_Evrak_Sıra_No] [int] NULL,
	[c_Hareket_Satir_No] [int] NULL,
	[c_Hareket_Tarih] [datetime] NULL,
	[c_Hareket_Tipi] [tinyint] NULL,
	[c_Hareket_Cinsi] [tinyint] NULL,
	[c_Normal_iade] [tinyint] NULL,
	[c_Cari_Pozisyonu] [tinyint] NULL,
	[c_Belge_No] [nvarchar](20) NULL,
	[c_Belge_Tarihi] [date] NULL,
	[c_Aciklama] [varchar](50) NULL,
	[c_Proje_Kodu] [varchar](25) NULL,
	[c_Cari_Kodu] [varchar](25) NULL,
	[c_Cari_Grup_No] [tinyint] NULL,
	[c_Ciro_Cari_Kodu] [varchar](25) NULL,
	[c_Doviz_Cinsi] [tinyint] NULL,
	[c_Doviz_Kuru] [float] NULL,
	[c_Miktar] [float] NULL,
	[c_Meblag] [float] NULL,
	[c_Aratoplam] [float] NULL,
	[c_Vade] [int] NULL,
	[c_Iskonto1] [float] NULL,
	[c_Iskonto2] [float] NULL,
	[c_Iskonto3] [float] NULL,
	[c_Masraf1] [float] NULL,
	[c_Masraf2] [float] NULL,
	[c_Masraf3] [float] NULL,
 CONSTRAINT [PK_TBL_CariHareketleri] PRIMARY KEY CLUSTERED 
(
	[c_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_CariHesaplar]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CariHesaplar](
	[c_Record] [bigint] IDENTITY(1,1) NOT NULL,
	[c_Guncelleme] [bit] NULL,
	[c_Guncelleme_Tarih] [date] NULL,
	[c_Guncelleme_Kullanici] [int] NULL,
	[c_Kayit_Tarih] [date] NULL,
	[c_Kayit_Kullanici] [int] NULL,
	[c_Cari_Kod] [nvarchar](25) NULL,
	[c_Cari_unvan1] [nvarchar](50) NULL,
	[c_Cari_unvan2] [nvarchar](50) NULL,
	[c_Vergi_Dairesi_Ad] [nvarchar](50) NULL,
	[c_Vergi_Dairesi_No] [nvarchar](15) NULL,
	[c_Sicil_No] [nvarchar](15) NULL,
	[c_Iban1] [nvarchar](26) NULL,
	[c_Iban2] [nvarchar](26) NULL,
	[c_Iban3] [nvarchar](26) NULL,
	[c_Ulke] [nvarchar](20) NULL,
	[c_Sehir] [nvarchar](20) NULL,
	[c_Ilce] [nvarchar](20) NULL,
	[c_Adres] [nvarchar](50) NULL,
	[c_Telefon1] [nvarchar](16) NULL,
	[c_Telefon2] [nvarchar](16) NULL,
	[c_Fax1] [nvarchar](16) NULL,
	[c_Fax2] [nvarchar](16) NULL,
	[c_Web] [nvarchar](50) NULL,
	[c_Mail1] [nvarchar](50) NULL,
	[c_Mail2] [nvarchar](50) NULL,
	[c_Yetkili1] [nvarchar](50) NULL,
	[c_Yetkili1_Mail] [nvarchar](50) NULL,
	[c_Yetkili1_Telefon] [nvarchar](16) NULL,
	[c_Yetkili2] [nvarchar](50) NULL,
	[c_Yetkili2_Mail] [nvarchar](50) NULL,
	[c_Yetkili2_Telefon] [nvarchar](16) NULL,
	[c_Yetkili3] [nvarchar](50) NULL,
	[c_Yetkili3_Mail] [nvarchar](50) NULL,
	[c_Yetkili3_Telefon] [nvarchar](16) NULL,
 CONSTRAINT [PK_TBL_CariHesaplar] PRIMARY KEY CLUSTERED 
(
	[c_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Depolar]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Depolar](
	[d_Record] [int] IDENTITY(1,1) NOT NULL,
	[d_iptal] [bit] NULL,
	[d_Kayit_Tarih] [date] NULL,
	[d_Kayit_Kullanici] [int] NULL,
	[d_Guncelleme] [bit] NULL,
	[d_Guncelleme_Kullanici] [int] NULL,
	[d_Guncelleme_Tarih] [date] NULL,
	[d_Firma_no] [int] NULL,
	[d_Sube_no] [int] NULL,
	[d_Depo_Adi] [nvarchar](50) NULL,
	[d_Cadde] [nvarchar](50) NULL,
	[d_Mahalle] [nvarchar](50) NULL,
	[d_Sokak] [nvarchar](50) NULL,
	[d_Semt] [nvarchar](50) NULL,
	[d_Apt_no] [nvarchar](10) NULL,
	[d_Daire_No] [nvarchar](10) NULL,
	[d_Posta_kodu] [nvarchar](8) NULL,
	[d_ilce] [nvarchar](15) NULL,
	[d_il] [nvarchar](15) NULL,
	[d_ulke] [nvarchar](15) NULL,
	[d_ulke_kod] [nvarchar](5) NULL,
	[d_depo_alani] [float] NULL,
	[d_depo_rafhacmi] [float] NULL,
	[d_yetkili_mail] [nvarchar](50) NULL,
	[d_satis_alani] [float] NULL,
	[d_sergi_alani] [float] NULL,
	[d_otopark_alani] [float] NULL,
	[d_otopark_kapasite] [int] NULL,
	[d_kasa_sayisi] [int] NULL,
	[d_kamyon_adedi] [int] NULL,
	[d_tel_ulke_kod] [nvarchar](5) NULL,
	[d_tel_bolge_kod] [nvarchar](5) NULL,
	[d_tel_no1] [nvarchar](10) NULL,
	[d_tel_no2] [nvarchar](10) NULL,
	[d_tel_no3] [nvarchar](10) NULL,
	[d_fax_no1] [nvarchar](10) NULL,
	[d_fax_no2] [nvarchar](10) NULL,
	[d_fax_no3] [nvarchar](10) NULL,
 CONSTRAINT [PK_TBL_Depolar] PRIMARY KEY CLUSTERED 
(
	[d_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Personeller]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Personeller](
	[p_Record] [int] IDENTITY(1,1) NOT NULL,
	[p_Iptal] [bit] NULL,
	[p_Kayit_Kullanici] [int] NULL,
	[p_Kayit_Tarih] [date] NULL,
	[p_Guncelleme] [bit] NULL,
	[p_Guncelleme_Tarih] [date] NULL,
	[p_Guncelleme_Kullanici] [int] NULL,
	[p_Isim] [nvarchar](50) NULL,
	[p_Soyisim] [nvarchar](50) NULL,
	[p_Sicil_No] [nvarchar](50) NULL,
	[p_Firma_No] [int] NULL,
	[p_Sube_No] [int] NULL,
	[p_Departman_Kodu] [varchar](25) NULL,
	[p_Ise_Giris_Tarih] [date] NULL,
	[p_Is_Cikis_Tarih] [date] NULL,
	[p_Is_Cikis_Nedeni] [nvarchar](25) NULL,
	[p_Egitim_Durumu] [varchar](50) NULL,
	[p_Uyrugu] [nvarchar](15) NULL,
	[p_Medeni_Hali] [tinyint] NULL,
	[p_Kan_Grup] [varchar](15) NULL,
	[p_Nuf_Seri_No] [nvarchar](15) NULL,
	[p_Nuf_il] [nvarchar](20) NULL,
	[p_Nuf_ilce] [nvarchar](20) NULL,
	[p_Nuf_Mahalle] [nvarchar](20) NULL,
	[p_Nuf_Koy] [nvarchar](20) NULL,
	[p_Nuf_Cilt_no] [nvarchar](10) NULL,
	[p_Nuf_Sayfa_no] [nvarchar](20) NULL,
	[p_Nuf_Ver_Nedeni] [nvarchar](20) NULL,
	[p_Nuf_Ver_Yer] [nvarchar](20) NULL,
	[p_Nuf_Ver_Tarih] [date] NULL,
	[p_Nuf_Cuz_Kayit_no] [nvarchar](15) NULL,
	[p_Ucret_Tipi] [tinyint] NULL,
	[p_Ucret_Tutarı] [money] NULL,
	[p_adr_Cadde] [nvarchar](75) NULL,
	[p_adr_Mahalle] [nvarchar](75) NULL,
	[p_adr_Sokak] [nvarchar](75) NULL,
	[p_adr_Semt] [nvarchar](75) NULL,
	[p_adr_apatman_no] [nvarchar](15) NULL,
	[p_adr_daire_no] [nvarchar](10) NULL,
	[p_adr_posta_kod] [nvarchar](8) NULL,
	[p_adr_ilce] [nvarchar](15) NULL,
	[p_adr_il] [nvarchar](20) NULL,
	[p_adr_ulke] [nvarchar](15) NULL,
	[p_adr_Ulke_Kod] [nvarchar](5) NULL,
 CONSTRAINT [PK_TBL_Personeller] PRIMARY KEY CLUSTERED 
(
	[p_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Siparisler]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Siparisler](
	[s_Record] [int] IDENTITY(1,1) NOT NULL,
	[s_iptal] [bit] NULL,
	[s_Kayit_Tarih] [date] NULL,
	[s_Kayit_Kullanici] [int] NULL,
	[s_Guncelleme] [bit] NULL,
	[s_Guncelleme_kullanici] [int] NULL,
	[s_Guncelleme_Tarih] [date] NULL,
	[s_FirmaNo] [int] NULL,
	[s_SubeNo] [int] NULL,
	[s_Siparis_Tarih] [date] NULL,
	[s_Siparis_Teslim_Tarih] [date] NULL,
	[s_Sipariş_Tipi] [tinyint] NULL,
	[s_Siparis_Cinsi] [tinyint] NULL,
	[s_Evrak_Seri_No] [nvarchar](20) NULL,
	[s_Evrak_Sira_No] [int] NULL,
	[s_Siparis_Satir_No] [int] NULL,
	[s_Belge_No] [nvarchar](20) NULL,
	[s_Belge_Tarih] [date] NULL,
	[s_Siparis_Kodu] [nvarchar](20) NULL,
	[s_Siparis_Genel_Durum] [nvarchar](25) NULL,
	[s_Siparis_Onay_Durum] [bit] NULL,
	[s_Siparis_Onaylayan] [int] NULL,
	[s_Aciklama] [nvarchar](100) NULL,
	[s_Musteri_Firma] [nvarchar](50) NULL,
	[s_Musteri_il] [nvarchar](25) NULL,
	[s_Musteri_ilce] [nvarchar](25) NULL,
	[s_Musteri_Adres] [nvarchar](25) NULL,
	[s_Musteri_Yetkili1_isim] [nvarchar](50) NULL,
	[s_Musteri_Yetkili1_Tel] [nvarchar](50) NULL,
	[s_Musteri_Yetkili1_Mail] [nvarchar](50) NULL,
	[s_Musteri_Yetkili2_isim] [nvarchar](50) NULL,
	[s_Musteri_Yetkili2_Tel] [nvarchar](50) NULL,
	[s_Musteri_Yetkili2_Mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBL_Siparisler] PRIMARY KEY CLUSTERED 
(
	[s_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Stok_Grupları]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Stok_Grupları](
	[s_Record] [int] IDENTITY(1,1) NOT NULL,
	[s_iptal] [bit] NULL,
	[s_Kayit_Tarih] [date] NULL,
	[s_Kayit_Kullanici] [int] NULL,
	[s_Guncelleme] [bit] NULL,
	[s_Guncelleme_kullanici] [int] NULL,
	[s_Guncelleme_Tarih] [date] NULL,
	[s_Grup_Adi] [nvarchar](50) NULL,
	[s_Grup_Kodu] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBL_Stok_Grupları] PRIMARY KEY CLUSTERED 
(
	[s_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Tezgahlar]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Tezgahlar](
	[t_Record] [int] IDENTITY(1,1) NOT NULL,
	[t_iptal] [bit] NULL,
	[t_Guncelle] [bit] NULL,
	[t_Guncelle_Kullanici] [int] NULL,
	[t_Guncelle_Tarih] [date] NULL,
	[t_Kayit_Kullanici] [int] NULL,
	[t_Kayit_Tarih] [date] NULL,
	[t_Tezgah_Kodu] [nvarchar](20) NULL,
	[t_Tezgah_Seri_No] [nvarchar](20) NULL,
	[t_Tezgah_Adi] [nvarchar](25) NULL,
	[t_Tezgah_Genel_Bilgi] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBL_Tezgahlar] PRIMARY KEY CLUSTERED 
(
	[t_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_UrunAgaci]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_UrunAgaci](
	[is_Record] [bigint] IDENTITY(1,1) NOT NULL,
	[is_Aktif] [bit] NULL,
	[is_Guncelleme_Durum] [bit] NULL,
	[is_Guncellenen_Tarih] [datetime] NULL,
	[is_Guncelleyen_Kullanici] [int] NULL,
	[is_Kayit_Tarihi] [datetime] NULL,
	[is_Kayit_Yapan_Kullanici] [int] NULL,
	[Ebeveyn_Id] [int] NULL,
	[Parent_Id] [int] NULL,
	[SiraKodu] [nvarchar](max) NULL,
	[Ana_Urun_Kodu] [int] NULL,
	[Ana_Urun_Adi] [varchar](500) NULL,
	[Parca_Kodu] [varchar](250) NULL,
	[Parca_Adi] [varchar](500) NULL,
	[Tanim] [varchar](500) NULL,
	[Birim] [nvarchar](50) NULL,
	[Miktar] [int] NULL,
	[Malzeme] [varchar](150) NULL,
	[Adet] [varchar](500) NULL,
	[Birim_Malz_Maliyet] [float] NULL,
	[Birim_Iscilik_Maliyet] [float] NULL,
	[Birim_Genel_Maliyet] [float] NULL,
 CONSTRAINT [PK_TBL_UrunAgaci] PRIMARY KEY CLUSTERED 
(
	[is_Record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_CariHareketleri] ON 

INSERT [dbo].[TBL_CariHareketleri] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Firma_No], [c_Sube_No], [c_Evrak_Kodu], [c_Evrak_Seri_No], [c_Evrak_Sıra_No], [c_Hareket_Satir_No], [c_Hareket_Tarih], [c_Hareket_Tipi], [c_Hareket_Cinsi], [c_Normal_iade], [c_Cari_Pozisyonu], [c_Belge_No], [c_Belge_Tarihi], [c_Aciklama], [c_Proje_Kodu], [c_Cari_Kodu], [c_Cari_Grup_No], [c_Ciro_Cari_Kodu], [c_Doviz_Cinsi], [c_Doviz_Kuru], [c_Miktar], [c_Meblag], [c_Aratoplam], [c_Vade], [c_Iskonto1], [c_Iskonto2], [c_Iskonto3], [c_Masraf1], [c_Masraf2], [c_Masraf3]) VALUES (1, NULL, NULL, NULL, CAST(N'2019-11-02' AS Date), 0, 1, 1, N'2131', N'213124', 1, 1, CAST(N'2019-11-02T00:00:00.000' AS DateTime), 0, 0, 0, 0, N'213', CAST(N'2019-11-02' AS Date), N'YENİ KAYIT', N'XAW12', N'12', 1, N'12', 0, 0, 929.5, 1500, 301.5, 3, 0.12, 0.08, 0.001, 100, 120, 49)
SET IDENTITY_INSERT [dbo].[TBL_CariHareketleri] OFF
SET IDENTITY_INSERT [dbo].[TBL_CariHesaplar] ON 

INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (1, NULL, NULL, NULL, CAST(N'2019-10-31' AS Date), 0, N'0000001', N'XYZ Makina', N'XYZ Mak', N'Vergi-1', N'2138311212', N'2138921894', N'TR12121242584545454', N'TR12313213134487787', N'TR12313213213221135', N'Türkiye', N'İstanbul', N'Beylikdüzü ', N'Sokak Adı Cadde No', N'123 456 78 90', N'123 456 78 90', N'212 212 12 12', N'212 212 12 13', N'xyz.com.tr', N'xyz@gmail.com', N'xyz@gmail.com', N'Ali', N'ad', N'213213', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (2, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000002', N'Dolor Vitae PC', N'Proin Dolor Nulla Incorporated', N'', N'2063', N'5875', N'5,22790593645555E+15', N'4929195985011', N'', N'Gibraltar', N'Gary', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Graiden Contreras', N'mauris.ut.mi@Duisatlacus.net', N'055 9902 2002', N'Paki Flynn', N'Proin@ornarelectusjusto.org', N'0845 46 48', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (3, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000003', N'Et Ultrices Ltd', N'Vel Lectus Industries', N'', N'2739', N'7522', N'5,45773431376599E+15', N'4,25223111551969E+15', N'', N'Seychelles', N'Swan Hill', N'', N'', N'', N'', N'', N'', N'www.etultricesltd.com', N'', N'', N'Reed Harrington', N'lobortis.quis@risusNuncac.com', N'070 2019 6662', N'Armand Berg', N'Aliquam.fringilla@estacfacilisis.net', N'(0110) 966 9156', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (4, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000004', N'Molestie Institute', N'Per Conubia Nostra Corporation', N'', N'7687', N'2519', N'5,48795619707834E+15', N'4916004003847', N'', N'Macao', N'Otranto', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Damian Chandler', N'Aenean.egestas@CrasinterdumNunc.org', N'0878 726 7281', N'Brody Peters', N'erat@enimEtiam.co.uk', N'0800 956188', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (5, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000005', N'Pellentesque Massa Lobortis Institute', N'Volutpat Nulla Company', N'', N'5217', N'8387', N'5411750876643700', N'4,53998264913148E+15', N'', N'United Kingdom (Grea', N'Wrigley', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Graham Wilson', N'quam.a@loremipsumsodales.com', N'055 7820 9652', N'Jamal Flowers', N'ut.odio.vel@quamquis.edu', N'0800 551734', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (6, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000006', N'Cum Sociis Foundation', N'A Dui Cras Corp.', N'', N'7114', N'2736', N'5,3715933506064E+15', N'4,77657597624718E+15', N'', N'Comoros', N'San Polo d''Enza', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Hamilton Pate', N'erat@eterosProin.co.uk', N'(016977) 8340', N'Magee Carney', N'vitae@enim.com', N'0978 479 0153', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (7, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000007', N'Eget Ipsum Donec Ltd', N'Risus Quis LLC', N'', N'9507', N'1925', N'5,34624801471614E+15', N'4684459260573', N'', N'Gambia', N'Nashville', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Berk Ellison', N'magna.Praesent@ac.edu', N'0845 46 44', N'Clark Ray', N'at.libero.Morbi@sem.edu', N'(023) 8535 6910', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (8, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000008', N'Nunc LLC', N'Phasellus Libero Foundation', N'', N'1118', N'6796', N'5,51178593640682E+15', N'4916805442590', N'', N'Heard Island ', N'Sosnowiec', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Dieter Pratt', N'justo@sagittis.ca', N'07458 888680', N'Sawyer Hart', N'libero@Donec.co.uk', N'(013949) 77041', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (9, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000009', N'Augue Industries', N'Suspendisse Sed LLC', N'', N'5912', N'4835', N'5,17247776518822E+15', N'4485696717999', N'', N'Guinea-Bissau', N'Lestizza', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Elton Carr', N'eleifend.egestas.Sed@lacus.ca', N'07373 817246', N'Nero Myers', N'Mauris.magna@Mauris.edu', N'0806 124 5123', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (10, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000010', N'Tristique Aliquet Associates', N'Inceptos Hymenaeos Mauris LLP', N'', N'9057', N'2577', N'5,17817267889211E+15', N'4485109752138', N'', N'Portugal', N'Halesowen', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Isaiah Bryan', N'in.tempus@tempor.com', N'(023) 9083 4198', N'Jonas Rivas', N'dolor.dapibus@QuisquevariusNam.net', N'0500 617482', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (11, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000011', N'In Tempus Eu PC', N'Magna Sed Eu Institute', N'', N'2537', N'1822', N'5,21832112992853E+15', N'4716583671398', N'', N'Bhutan', N'Hampstead', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Tiger Goff', N'eget@inhendreritconsectetuer.ca', N'(013217) 87940', N'Plato Williams', N'non.massa.non@nostraper.org', N'0800 377960', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (12, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000012', N'Aliquet Consulting', N'Molestie Arcu Institute', N'', N'1192', N'3986', N'5,28473494653935E+15', N'4532466636246', N'', N'Morocco', N'Arsimont', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Ivor Terrell', N'porttitor.interdum.Sed@malesuada.ca', N'(0112) 594 6354', N'Stuart Rosario', N'Vivamus.rhoncus@ridiculus.net', N'07624 672973', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (13, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000013', N'Tellus Eu Augue Consulting', N'Risus Quis Corp.', N'', N'2661', N'3619', N'5,14421052787305E+15', N'4,71638386139964E+15', N'', N'Romania', N'Silifke', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Damon Grant', N'litora.torquent@sagittislobortis.com', N'07863 660862', N'Marsden Patterson', N'ultrices@Inscelerisquescelerisque.org', N'0800 1111', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (14, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000014', N'Lorem Ipsum Corp.', N'Gravida Limited', N'', N'8926', N'6151', N'5,59864167445461E+15', N'4929855717530', N'', N'Ghana', N'Alert Bay', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Raymond Crawford', N'Integer.mollis@etrisusQuisque.org', N'(01871) 736071', N'Daniel Morrow', N'Nunc@lobortis.ca', N'070 0631 7323', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (15, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000015', N'Donec Dignissim Industries', N'Feugiat Metus Foundation', N'', N'2860', N'7393', N'5,25155799913354E+15', N'4,02400719489301E+15', N'', N'Spain', N'Gorbea', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Steven Keller', N'Quisque.ornare@aliquetlibero.com', N'0500 550150', N'Felix Ramsey', N'Etiam@faucibusorciluctus.ca', N'070 3681 4376', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (16, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000016', N'Sem Molestie Sodales PC', N'Lectus LLC', N'', N'5648', N'7739', N'5,10270427494093E+15', N'4485458303434', N'', N'Turkey', N'Drumheller', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Sebastian Mccoy', N'interdum.Sed@Duisrisus.ca', N'0900 270 8015', N'Finn Duncan', N'felis.eget.varius@turpisegestasFusce.co.uk', N'(01801) 010841', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (17, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000017', N'Venenatis Associates', N'Scelerisque Sed Sapien Company', N'', N'3749', N'9727', N'5,12329696139785E+15', N'4,53978111642507E+15', N'', N'Indonesia', N'Milford Haven', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Steven Navarro', N'enim@veliteu.com', N'056 6601 2893', N'Robert Kirkland', N'diam.Pellentesque.habitant@pellentesqueSeddictum.o', N'(028) 3304 3768', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (18, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000018', N'Ultrices Mauris Ipsum PC', N'Semper Dui Lectus Institute', N'', N'9235', N'8627', N'5,5486348105496E+15', N'4,91644762229684E+15', N'', N'Qatar', N'Stirling', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Ishmael Haley', N'vitae@Donecnibh.com', N'07197 985559', N'Rooney English', N'varius@odio.net', N'0800 862 0278', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (19, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000019', N'Dictum LLP', N'Quisque Varius Nam Industries', N'', N'6656', N'4942', N'5,26005063535292E+15', N'4916451603271', N'', N'Saint Vincent ', N'Moliterno', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Owen Patrick', N'dictum.sapien.Aenean@necmauris.edu', N'0500 119448', N'Lars Barber', N'Vestibulum.ante@dis.ca', N'07474 131165', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (20, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000020', N'Duis At Incorporated', N'Erat Vivamus Foundation', N'', N'1206', N'9276', N'5,27062450864586E+15', N'4,53940970591279E+15', N'', N'Yemen', N'Fresia', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'John Solis', N'urna.suscipit@nuncinterdumfeugiat.co.uk', N'055 2074 5803', N'Keefe Sexton', N'vestibulum.Mauris.magna@mauris.edu', N'(0116) 940 8412', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (21, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000021', N'Malesuada Vel Incorporated', N'Et Netus PC', N'', N'8932', N'9362', N'5,54249029814368E+15', N'4,91685404054392E+15', N'', N'Slovenia', N'Bad Hersfeld', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Chase Booker', N'ornare.Fusce@erosturpis.edu', N'(01363) 53617', N'Holmes Carroll', N'enim.consequat@nonmagnaNam.com', N'055 8092 7940', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (22, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000022', N'Dolor Nulla Semper Foundation', N'Aenean Egestas Hendrerit Industries', N'', N'9040', N'8662', N'5,36993167040523E+15', N'4,4851243975968E+15', N'', N'Holy See (Vatican Ci', N'Ingelheim', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Thomas Stewart', N'amet@Donecelementum.co.uk', N'0900 541 1267', N'George Rivas', N'purus.gravida@ligulaconsectetuer.net', N'(029) 8076 1535', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (23, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000023', N'Integer Associates', N'Enim Etiam Imperdiet LLC', N'', N'3849', N'8898', N'5,47707697632261E+15', N'4,92973172441775E+15', N'', N'Malaysia', N'Navsari', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Conan Holman', N'neque.tellus.imperdiet@aliquetodioEtiam.org', N'076 0263 7058', N'James Oliver', N'Praesent.luctus.Curabitur@loremacrisus.edu', N'07739 580205', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (24, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000024', N'Volutpat Associates', N'Ac Mattis Ornare Foundation', N'', N'8375', N'9293', N'5,51914521105461E+15', N'4916999066346', N'', N'Comoros', N'Oyen', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Maxwell Sweeney', N'egestas.a@nuncest.com', N'07624 915331', N'Dominic Wilkerson', N'arcu.Morbi@sedfacilisisvitae.org', N'0947 399 0802', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (25, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000025', N'Enim Suspendisse Corporation', N'Rutrum Corporation', N'', N'5262', N'2017', N'5,489615664499E+15', N'4,02400719195683E+15', N'', N'United States', N'Madison', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jackson Mccullough', N'Nulla@placeratorcilacus.com', N'(01879) 41085', N'Bruce Ross', N'massa.lobortis@Vivamusnibhdolor.net', N'0362 385 5488', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (26, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000026', N'Nibh Phasellus Nulla Inc.', N'Quisque Ornare Tortor Associates', N'', N'5098', N'7642', N'5,3537697878208E+15', N'4,53234885771306E+15', N'', N'Palau', N'Hohen Neuendorf', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Burton Ferguson', N'ornare.libero.at@Donec.co.uk', N'(015235) 88727', N'Isaac Rowe', N'sit.amet.massa@ornarelectus.ca', N'(0112) 389 5814', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (27, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000027', N'Semper Erat In Inc.', N'Tincidunt Vehicula Risus Company', N'', N'1179', N'6444', N'5,47138195821142E+15', N'4929931117309', N'', N'Hungary', N'Olsztyn', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Reece Rojas', N'blandit.Nam.nulla@Curabitur.ca', N'(0114) 182 3543', N'Kasimir Mcpherson', N'Vivamus.rhoncus.Donec@etmalesuada.net', N'07624 691964', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (28, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000028', N'Malesuada Industries', N'Gravida Foundation', N'', N'1736', N'8522', N'5,24960232077468E+15', N'4,71669522091196E+15', N'', N'Bangladesh', N'Thurso', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Carl Mclaughlin', N'adipiscing.enim@lacusvariuset.co.uk', N'07624 807265', N'Eric Battle', N'odio.semper@Nuncullamcorpervelit.ca', N'(022) 0559 4624', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (29, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000029', N'Scelerisque Neque Sed Associates', N'Amet Orci Ut Consulting', N'', N'9908', N'7951', N'5,4011064593028E+15', N'4,91619379241568E+15', N'', N'El Salvador', N'Villafranca ', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Arthur Contreras', N'consequat@Nuncuterat.com', N'07624 870860', N'Xanthus Golden', N'In@vitae.ca', N'0845 46 47', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (30, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000030', N'Ullamcorper Viverra Inc.', N'Nec Consulting', N'', N'6565', N'8216', N'5,10359971038815E+15', N'4,55662212028703E+15', N'', N'Ghana', N'Lauw', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Caesar Shannon', N'pede.Cum.sociis@eunibh.edu', N'0800 706 3921', N'Branden Edwards', N'Proin.non.massa@perconubia.net', N'070 4287 9366', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (31, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000031', N'Ipsum Limited', N'A Feugiat Limited', N'', N'3259', N'5204', N'5,18398458828621E+15', N'4024007191576', N'', N'Zambia', N'Salzburg', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Yoshio Bauer', N'vitae.dolor.Donec@aliquamarcu.com', N'055 8584 4561', N'Zeus Macias', N'Mauris@felis.edu', N'0800 928 7336', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (32, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000032', N'Pellentesque Ut Corporation', N'Faucibus Lectus Company', N'', N'1830', N'8777', N'5,26901826205561E+15', N'4,71661961406524E+15', N'', N'Myanmar', N'İzmit', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Mannix Byrd', N'nonummy@litoratorquentper.edu', N'(0112) 893 5262', N'Herman Hutchinson', N'tincidunt@enimEtiamgravida.edu', N'0372 748 5993', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (33, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000033', N'Malesuada Augue Inc.', N'Tempus Lorem Foundation', N'', N'5935', N'9504', N'5,50880109032856E+15', N'4539263820519', N'', N'China', N'Ludlow', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Martin Suarez', N'Etiam@Donec.ca', N'0937 414 6144', N'Hasad Williams', N'et.malesuada@rutrum.ca', N'0845 46 42', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (34, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000034', N'Et Malesuada Ltd', N'Tristique Institute', N'', N'5490', N'2121', N'5,48492682499261E+15', N'4916006663952', N'', N'Romania', N'Yeotmal', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Alec Cleveland', N'scelerisque.mollis@orciDonec.co.uk', N'0800 532427', N'Nathan Freeman', N'Maecenas.mi@sollicitudinorcisem.co.uk', N'(01238) 37271', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (35, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000035', N'Aliquam Foundation', N'Sit Amet LLC', N'', N'4237', N'9178', N'5,35434975406034E+15', N'4556008553403', N'', N'Philippines', N'Caloundra', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Harrison Taylor', N'mauris.Suspendisse.aliquet@Duisami.edu', N'0857 285 7093', N'Marshall Hester', N'ultrices.posuere.cubilia@magnamalesuada.org', N'0800 1111', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (36, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000036', N'Consectetuer Mauris Consulting', N'Aenean Eget Foundation', N'', N'4526', N'4086', N'5,45413621986346E+15', N'4,48524244764407E+15', N'', N'Norway', N'Lobbes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Benjamin Barrera', N'nec@varius.com', N'(026) 0206 6058', N'Carlos Albert', N'ultrices.sit@Curabitur.ca', N'(019502) 32343', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (37, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000037', N'Est Corporation', N'Aenean Institute', N'', N'7269', N'5260', N'5,17734353532389E+15', N'4929514422977', N'', N'Saudi Arabia', N'Ancaster Town', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Grant Mercado', N'tempor.diam@diamProin.edu', N'055 3662 1775', N'Brenden Coffey', N'gravida@ipsumdolorsit.ca', N'070 4413 7570', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (38, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000038', N'Arcu Inc.', N'Id Incorporated', N'', N'4858', N'3993', N'5,26450887858758E+15', N'4,55682473241135E+15', N'', N'Netherlands', N'Cannalonga', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Zeus Haney', N'vel.quam@nuncest.com', N'(018610) 99656', N'Lev Sampson', N'consectetuer.adipiscing.elit@aliquetodio.co.uk', N'07851 922511', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (39, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000039', N'Mauris Foundation', N'Vestibulum Ante Ipsum Industries', N'', N'2373', N'4629', N'5,468907580281E+15', N'4929782651711', N'', N'Palestine, State of', N'Dewas', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Harding Elliott', N'pede@euneque.ca', N'07780 150345', N'Dane Howard', N'Phasellus.elit@Nunc.ca', N'0800 1111', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (40, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000040', N'Rutrum Eu Ultrices Inc.', N'Eu LLP', N'', N'4589', N'2795', N'5,16112636950364E+15', N'4,71689429325071E+15', N'', N'Mali', N'Sachs Harbour', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Malcolm Thompson', N'quis@erat.co.uk', N'(01232) 439036', N'Jakeem Bartlett', N'diam@miDuis.edu', N'0981 608 6760', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (41, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000041', N'Et Commodo At Corp.', N'Auctor Company', N'', N'5535', N'3165', N'5,48238676172438E+15', N'4556616540263', N'', N'Yemen', N'Palermo', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Hedley Lopez', N'malesuada.vel.venenatis@malesuadafames.ca', N'(01562) 91187', N'Beau Booth', N'eu@Quisque.com', N'07570 942084', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (42, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000042', N'Convallis Ligula Donec PC', N'Vestibulum LLP', N'', N'7965', N'1930', N'5,34046542975173E+15', N'4556152984313', N'', N'Honduras', N'Zapallar', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Hop Reeves', N'et.pede@convallisconvallisdolor.org', N'(018090) 64403', N'Stephen Spears', N'porta.elit@sitamet.com', N'0800 1111', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (43, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000043', N'Mi Company', N'Id Mollis Nec Company', N'', N'8498', N'9914', N'5,2296392687412E+15', N'4916867882790', N'', N'Tanzania', N'Reinbek', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Ronan Conner', N'at.arcu@semsemper.co.uk', N'(0115) 794 5034', N'Damon Conley', N'turpis.Aliquam@leo.net', N'070 2427 1867', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (44, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000044', N'Nunc Risus Incorporated', N'Et Eros Corp.', N'', N'7497', N'1320', N'5,25449763138402E+15', N'4355144542663', N'', N'Australia', N'Saint-Honor�', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jacob Rush', N'sit.amet.ornare@dolor.ca', N'076 4337 6313', N'Declan Simon', N'dui.augue@infaucibusorci.ca', N'(0101) 490 1118', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (45, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000045', N'Quisque Ornare Corporation', N'Dolor Fusce Mi Company', N'', N'8415', N'6068', N'5,23222923430069E+15', N'4349290091401', N'', N'Djibouti', N'Hervey Bay', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Charles Berry', N'dui.Cras.pellentesque@Praesenteudui.ca', N'07624 956044', N'Clinton Eaton', N'a@facilisisfacilisismagna.net', N'0956 355 0484', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (46, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000046', N'Ligula Eu Enim Corporation', N'Tincidunt Tempus Risus PC', N'', N'7633', N'8909', N'5,2490109235407E+15', N'4539464926651', N'', N'Hungary', N'Burnie', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Quinn Mcdonald', N'ligula.Aenean.gravida@eliteratvitae.edu', N'(0110) 045 2839', N'Joshua Shepherd', N'felis.ullamcorper@vulputateeu.com', N'0800 682 6266', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (47, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000047', N'Ornare Lectus Corp.', N'Parturient Montes PC', N'', N'4138', N'4969', N'5,27581027443616E+15', N'4,71663933867502E+15', N'', N'Thailand', N'Forgaria nel Friuli', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Alfonso Osborn', N'velit.Quisque@necurna.net', N'070 3419 0458', N'Otto Thornton', N'placerat.augue.Sed@a.net', N'076 7543 9046', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (48, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000048', N'Et Magna LLP', N'Enim Nisl Industries', N'', N'4133', N'6998', N'5,32553243632168E+15', N'4,91659271343119E+15', N'', N'Guam', N'Beaconsfield', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Gray Mullen', N'tincidunt.dui@maurisidsapien.ca', N'055 0638 1234', N'Jarrod Steele', N'per@dapibusrutrumjusto.co.uk', N'0800 867017', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (49, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000049', N'Integer Inc.', N'Natoque Penatibus Et Institute', N'', N'8757', N'8105', N'5,48614014751426E+15', N'4,53960035496384E+15', N'', N'Honduras', N'Borghetto di Vara', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Knox Byers', N'pellentesque.tellus.sem@velitAliquamnisl.ca', N'0500 810858', N'Wang Gilmore', N'tellus.Phasellus@Sed.net', N'(0113) 441 7663', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (50, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000050', N'Hymenaeos Mauris Ut LLP', N'Sem Ltd', N'', N'9263', N'7475', N'5,56675319434984E+15', N'4,48552156281463E+15', N'', N'South Georgia ', N'Valpelline', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Gregory Benjamin', N'Donec.tempor@Nunclaoreet.edu', N'(01542) 941389', N'Dennis Norman', N'Nunc.commodo.auctor@montes.ca', N'0500 561879', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (51, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000051', N'Nullam Nisl Maecenas Incorporated', N'Feugiat Lorem Ipsum Industries', N'', N'6795', N'5719', N'5,43214250325983E+15', N'4975674858500', N'', N'Philippines', N'Carson City', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Herrod Flores', N'tortor.dictum@scelerisquedui.com', N'055 4724 6812', N'Garrison Rosario', N'ante.dictum.mi@elementumategestas.ca', N'0845 46 41', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (52, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000052', N'Aliquet Odio Corp.', N'Nunc LLP', N'', N'8140', N'9570', N'5,19366780810171E+15', N'4024007192434', N'', N'Saint Vincent', N'Howrah', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Magee William', N'mauris.a@pellentesque.net', N'(0110) 677 1800', N'Alfonso Burt', N'pretium@elit.com', N'070 2367 1248', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (53, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000053', N'Phasellus In Felis PC', N'Luctus Industries', N'', N'8514', N'8484', N'5,56650299932368E+15', N'4,02400719594777E+15', N'', N'Svalbard', N'Llaillay', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Mannix Macdonald', N'orci@interdumCurabitur.org', N'076 8783 1876', N'Dorian Collier', N'Mauris.magna@purussapiengravida.com', N'0815 276 3072', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (54, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000054', N'Pharetra Nam LLC', N'Commodo Company', N'', N'4852', N'6767', N'5,49534271379264E+15', N'4024007146034', N'', N'Saudi Arabia', N'Huntsville', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Grant Kirk', N'dui@velitin.edu', N'07624 304152', N'Tucker Maxwell', N'Cum.sociis.natoque@IntegerurnaVivamus.org', N'(029) 0427 5670', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (55, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000055', N'Leo Consulting', N'Lobortis LLC', N'', N'4185', N'1137', N'5,51948851642762E+15', N'4716912730055', N'', N'Nigeria', N'Luttre', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Steven Harris', N'lacus.Ut.nec@nulla.edu', N'0861 650 0385', N'Chancellor Mcgee', N'aliquet.molestie@purusmauris.ca', N'0845 46 47', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (56, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000056', N'Fringilla Associates', N'Non Egestas LLC', N'', N'3900', N'1444', N'5,35621958771942E+15', N'4,91626109745405E+15', N'', N'Reunion', N'Kota', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Carl Carroll', N'hymenaeos.Mauris@eu.ca', N'(016522) 41076', N'Lars Mooney', N'rutrum.justo.Praesent@augue.edu', N'(01621) 03589', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (57, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000057', N'Sed Eu Industries', N'Tincidunt Neque Vitae Industries', N'', N'9430', N'9457', N'5,25177703790349E+15', N'4,48570602528432E+15', N'', N'Côte D''Ivoire', N'Newtown', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Giacomo Reid', N'libero.Integer@ultrices.edu', N'07624 459518', N'Valentine Wooten', N'natoque.penatibus@enimconsequat.ca', N'0800 969 9476', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (58, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000058', N'Lacinia Vitae Company', N'Suspendisse LLP', N'', N'8017', N'7536', N'5,48214865199983E+15', N'4,92994133300053E+15', N'', N'Chad', N'Huizingen', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Brock Bauer', N'mollis.Phasellus@Morbisit.net', N'(01144) 24407', N'Talon Avila', N'nulla.In.tincidunt@Nuncut.com', N'056 5835 7917', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (59, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000059', N'Natoque Penatibus PC', N'Fermentum Fermentum Arcu Ltd', N'', N'2920', N'5641', N'5,47593059985897E+15', N'4556843439834', N'', N'Romania', N'Valéncia', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jonas Rosa', N'rhoncus.id@pellentesquetellus.com', N'076 1839 8627', N'Vance Irwin', N'ac.turpis@amet.net', N'(010675) 01298', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (60, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000060', N'Dolor LLC', N'Posuere Enim Inc.', N'', N'4202', N'4794', N'5,50870159955188E+15', N'4556809509042', N'', N'Falkland Islands', N'Contagem', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Macaulay Henry', N'eu.nulla.at@sedtortorInteger.org', N'076 5829 4747', N'Arsenio Peck', N'Cras.interdum.Nunc@ultricesposuerecubilia.net', N'(0161) 918 6072', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (61, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000061', N'Sed Dolor Fusce LLP', N'Aliquam Vulputate Foundation', N'', N'6768', N'1056', N'5,16648555254955E+15', N'4,92995856907859E+15', N'', N'Austria', N'Mogliano', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Joseph Simon', N'per.inceptos@maurissapiencursus.edu', N'(01243) 266943', N'Ulric Sheppard', N'senectus@adipiscing.net', N'076 0039 8529', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (62, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000062', N'Fringilla Corporation', N'Et Pede Nunc Corp.', N'', N'1898', N'5455', N'5,50743729337522E+15', N'4539469919529', N'', N'Niger', N'Otricoli', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Kennan Wilkinson', N'et.ipsum@duinecurna.net', N'(014758) 12650', N'Kennedy Duffy', N'eleifend.nunc.risus@necurna.ca', N'(0141) 499 9357', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (63, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000063', N'Neque Limited', N'Sem Egestas Foundation', N'', N'3585', N'1875', N'5,55820431190494E+15', N'4,53253516725368E+15', N'', N'Madagascar', N'Knoxville', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Driscoll Branch', N'parturient@duiCumsociis.com', N'070 3191 5957', N'Paki Burt', N'justo.Praesent@laoreet.net', N'07962 487758', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (64, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000064', N'In Incorporated', N'Tellus PC', N'', N'4620', N'9849', N'5,41745915783839E+15', N'4,92963632680687E+15', N'', N'Slovenia', N'Vellore', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Dalton Greene', N'turpis@scelerisqueneque.com', N'07777 923761', N'Chaim Beasley', N'cursus.vestibulum@ligula.co.uk', N'076 9161 3288', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (65, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000065', N'Nunc Commodo Incorporated', N'Ligula Aliquam Consulting', N'', N'3507', N'2864', N'5,39273232202165E+15', N'4,02400712279578E+15', N'', N'Jersey', N'Onoz', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Michael Robbins', N'ac.fermentum.vel@acfacilisis.org', N'056 9181 9062', N'Coby Sheppard', N'malesuada@nequevenenatislacus.net', N'0308 075 5280', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (66, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000066', N'Ornare Elit Elit Industries', N'Felis Purus Ac Limited', N'', N'4054', N'4369', N'5,38128887971881E+15', N'4916167991788', N'', N'Saudi Arabia', N'Vitry-sur-Seine', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Brett Carlson', N'sem@anunc.edu', N'056 2302 3570', N'Colby Conrad', N'Sed.eu@interdumfeugiatSed.org', N'0845 46 49', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (67, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000067', N'Mi LLP', N'Feugiat Corporation', N'', N'6990', N'5703', N'5,13180406963451E+15', N'4539739295189', N'', N'Hungary', N'Baden', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Guy Torres', N'Etiam@Aliquamerat.net', N'056 5945 9603', N'Hayes Estes', N'sit.amet.consectetuer@sit.edu', N'070 4946 7377', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (68, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000068', N'Malesuada Id Associates', N'Facilisis LLC', N'', N'2624', N'7011', N'5,42399034368644E+15', N'4642187864983', N'', N'Reunion', N'Llangollen', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Yoshio Reyes', N'sem.ut@orciUtsagittis.edu', N'0845 46 41', N'Donovan Sherman', N'mollis@actellusSuspendisse.com', N'0800 840 5979', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (69, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000069', N'Netus Et PC', N'Egestas A Associates', N'', N'9055', N'9434', N'5,43776590197619E+15', N'4,4856509177042E+15', N'', N'Sint Maarten', N'Saint-Laurent', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jerry Sims', N'eu.odio.tristique@euodio.net', N'056 3794 5063', N'Brenden Roberson', N'enim.Sed@laciniamattisInteger.co.uk', N'(0141) 273 5975', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (70, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000070', N'Ut Consulting', N'Mauris Erat Eget PC', N'', N'6201', N'6383', N'5,22878496183079E+15', N'4556938902324', N'', N'Saint Pierre ', N'Kaster', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Colt Mack', N'erat@lectusjusto.net', N'0884 712 3400', N'Joseph Garza', N'in.aliquet.lobortis@consectetuercursuset.edu', N'055 9601 3457', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (71, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000071', N'Pellentesque Corp.', N'Velit Corporation', N'', N'9883', N'6972', N'5,42458274820343E+15', N'4539225726119', N'', N'Bangladesh', N'Kenosha', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Sawyer Lindsey', N'non.luctus@mauris.com', N'(018171) 98607', N'Rigel Farmer', N'dictum@velit.net', N'055 6939 8559', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (72, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000072', N'Vitae Purus Inc.', N'Nec Institute', N'', N'1823', N'1157', N'5,31809813545449E+15', N'4929851793618', N'', N'Cape Verde', N'Corbara', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Orlando Brock', N'nascetur.ridiculus@Vestibulum.co.uk', N'0371 697 3153', N'Daniel May', N'pharetra@tortordictum.com', N'0800 298951', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (73, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000073', N'Etiam Imperdiet Dictum Inc.', N'Pede Cras Ltd', N'', N'1032', N'1886', N'5,48644155312232E+15', N'4,48570870742244E+15', N'', N'Armenia', N'Montelupo Fiorentino', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Raymond Jenkins', N'ut.erat.Sed@musProin.ca', N'0800 585343', N'Zeph Martin', N'amet@Maecenasmalesuadafringilla.com', N'0858 882 4746', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (74, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000074', N'Nisi Cum LLC', N'Ante Limited', N'', N'9936', N'6364', N'5,18165796211814E+15', N'4916493466547', N'', N'Libya', N'Werbomont', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Merritt Sanders', N'sapien@sit.org', N'070 4420 8197', N'Justin Miranda', N'egestas.lacinia@Craseu.co.uk', N'0810 449 8270', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (75, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000075', N'Aliquet Molestie Tellus Limited', N'Egestas Foundation', N'', N'5586', N'2696', N'5,56935709196872E+15', N'4539004839091', N'', N'India', N'Halifax', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jamal Charles', N'vehicula.risus@mauris.org', N'(0119) 001 9247', N'Perry Potts', N'tellus.Nunc.lectus@aceleifend.net', N'076 8161 7553', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (76, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000076', N'Fusce Aliquam Enim Foundation', N'Eget Odio Aliquam LLC', N'', N'9344', N'9358', N'5,51278524861581E+15', N'4916670424145', N'', N'Slovenia', N'Meetkerke', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Lamar Wong', N'suscipit.est.ac@egestasSedpharetra.org', N'(0141) 741 3364', N'Thor Garcia', N'velit.egestas.lacinia@ac.co.uk', N'07624 876080', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (77, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000077', N'Nec Orci Company', N'Quisque Nonummy Ipsum Corp.', N'', N'7237', N'7972', N'5,39936195129542E+15', N'4,92983892464465E+15', N'', N'Slovenia', N'Pangnirtung', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Anthony Nash', N'ultricies@nibh.org', N'0845 46 44', N'Griffith Burgess', N'in.aliquet.lobortis@duiCumsociis.co.uk', N'(0111) 568 3474', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (78, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000078', N'Nec Tempus Scelerisque Limited', N'Non Sollicitudin A Ltd', N'', N'1703', N'7296', N'5,24611988402521E+15', N'4096252423714', N'', N'Laos', N'Roxboro', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Hall Duncan', N'ullamcorper@Proinvelarcu.edu', N'0800 1111', N'Stone Webster', N'elit@tellusnonmagna.com', N'(0114) 825 0850', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (79, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000079', N'Pellentesque Eget Dictum Ltd', N'Nisi Corporation', N'', N'1968', N'7152', N'5,20848843715062E+15', N'4024007184340', N'', N'Niue', N'Crehen', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Norman Holloway', N'erat.in@maurisIntegersem.net', N'0500 174543', N'Blaze Roth', N'ornare.In.faucibus@euenimEtiam.net', N'(021) 0679 2540', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (80, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000080', N'Tortor Associates', N'Sem Ltd', N'', N'5977', N'2520', N'5,42089497702066E+15', N'4716351121964', N'', N'Slovenia', N'Villers-la-Ville', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Hammett Sanford', N'cursus.a@Quisque.co.uk', N'0945 110 9136', N'Dillon Houston', N'parturient.montes@etmagnisdis.org', N'(016190) 10633', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (81, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000081', N'Sollicitudin A Consulting', N'Nulla Company', N'', N'7322', N'5950', N'5,49643137620898E+15', N'4,92971085541331E+15', N'', N'Mauritania', N'Grumo Appula', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Robert Hurley', N'a@utnullaCras.edu', N'0500 123748', N'Fitzgerald Stuart', N'auctor.non@ultricesposuere.ca', N'(016073) 45452', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (82, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000082', N'Aliquam Arcu LLP', N'Proin Industries', N'', N'2776', N'3868', N'5,4101225678412E+15', N'4,55692546396878E+15', N'', N'Jamaica', N'Glendale', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Ryder Hinton', N'placerat.orci.lacus@a.edu', N'(025) 8944 1750', N'Cyrus Steele', N'eget.lacus.Mauris@gravidanunc.ca', N'0500 786391', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (83, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000083', N'Nibh Phasellus Associates', N'Est Congue Company', N'', N'5835', N'5440', N'5,28697043175709E+15', N'4916494884870', N'', N'Jamaica', N'Wechelderzande', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jackson Kane', N'cursus@posuereatvelit.com', N'(01359) 583468', N'Lester Parrish', N'mollis.nec@magnamalesuadavel.com', N'0800 396 5687', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (84, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000084', N'Ac Mattis Ltd', N'Pharetra Corp.', N'', N'4388', N'9895', N'5,32170680309089E+15', N'4532950764777', N'', N'Suriname', N'Melsbroek', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jason Koch', N'turpis.Nulla.aliquet@enim.net', N'0919 448 5017', N'Macaulay Henson', N'condimentum@Vivamusnibhdolor.co.uk', N'(0117) 945 6255', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (85, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000085', N'Non Corporation', N'A Mi Associates', N'', N'5721', N'7895', N'5,30729633972559E+15', N'4929595673712', N'', N'Brunei', N'Portico e San Benede', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Neil Hamilton', N'aliquet.Proin@auctor.edu', N'(016977) 6087', N'Ronan Moreno', N'dolor.Fusce@malesuadafamesac.ca', N'0500 697957', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (86, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000086', N'Purus LLC', N'Class Aptent Taciti Corporation', N'', N'7966', N'7405', N'5,55977690459223E+15', N'4,53279514334119E+15', N'', N'Peru', N'Oelegem', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Hunter Weeks', N'tellus.Suspendisse@ornaretortor.edu', N'(011041) 36552', N'Devin Dunn', N'Praesent.eu@purusactellus.net', N'07624 911707', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (87, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000087', N'Ut Corporation', N'Sapien Aenean Massa Associates', N'', N'7915', N'7361', N'5,44763171663948E+15', N'4916222545611', N'', N'Costa Rica', N'Aquila d''Arroscia', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Brody Aguirre', N'amet@egetmassa.edu', N'(01565) 541341', N'Raphael Buck', N'massa.lobortis@felisorciadipiscing.co.uk', N'(021) 4133 4151', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (88, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000088', N'Non Ltd', N'Nibh Enim Gravida Consulting', N'', N'3453', N'4805', N'5,45269700970353E+15', N'4,92903294855553E+15', N'', N'Puerto Rico', N'Giarratana', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Edward Hinton', N'eleifend.nec.malesuada@sociisnatoque.org', N'(01301) 402098', N'Roth Head', N'porttitor.interdum.Sed@bibendumfermentum.edu', N'(0113) 923 3801', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (89, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000089', N'Ac Mattis Consulting', N'Dictum Eu Placerat LLC', N'', N'5759', N'6682', N'5,28123887369588E+15', N'4,92925693235248E+15', N'', N'Niue', N'Orangeville', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Gary Levy', N'neque.venenatis@tortorNunc.net', N'0800 396 4338', N'Brennan Stokes', N'arcu@asollicitudinorci.ca', N'0800 930 2921', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (90, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000090', N'Sed Corporation', N'Cursus Purus Associates', N'', N'5387', N'1259', N'5,23883466031485E+15', N'4532265771095', N'', N'Sudan', N'Eyemouth', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Brett Welch', N'In.at@sempererat.com', N'056 4842 5846', N'Wing Herrera', N'sem@odioPhasellusat.ca', N'070 6154 2711', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (91, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000091', N'Purus Gravida Sagittis Industries', N'Bibendum Sed Associates', N'', N'8220', N'6563', N'5,27681576558396E+15', N'4,53278676816817E+15', N'', N'Virgin Islands, Brit', N'Oxford County', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Keith Cortez', N'nulla@urnaUt.edu', N'(0116) 975 6174', N'Asher Reynolds', N'interdum.feugiat@mattisCraseget.edu', N'(01463) 103559', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (92, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000092', N'Elementum Corporation', N'Phasellus Inc.', N'', N'7705', N'6205', N'5,20974274419307E+15', N'4,92992519442978E+15', N'', N'Moldova', N'Montjovet', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Jeremy Blair', N'eget.nisi@luctus.co.uk', N'0800 035608', N'Elijah Mosley', N'dolor.vitae@egetmagnaSuspendisse.net', N'(01700) 15451', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (93, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000093', N'Donec Sollicitudin Adipiscing Industries', N'Tempus Eu Incorporated', N'', N'9354', N'2701', N'5,45018777839439E+15', N'4532521772101', N'', N'Christmas Island', N'Trevignano Romano', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Logan Trujillo', N'ullamcorper.Duis@mollisPhaselluslibero.edu', N'(0141) 093 2463', N'Fritz Ramirez', N'ligula@nunc.co.uk', N'0903 307 8102', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (94, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000094', N'Aliquam PC', N'Nulla Corp.', N'', N'5054', N'5152', N'5,41931651197343E+15', N'4,71649606366369E+15', N'', N'Portugal', N'Parramatta', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Dorian Griffith', N'luctus.lobortis@laoreetipsum.ca', N'056 4234 1343', N'Gareth Cochran', N'tellus.imperdiet.non@magnaNam.com', N'056 2012 9182', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (95, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000095', N'Nec Foundation', N'Urna Convallis Erat Institute', N'', N'2383', N'4491', N'5,35440711286017E+15', N'4532353169186', N'', N'New Zealand', N'Hudson Bay', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Brenden Lane', N'ut@enim.com', N'(015784) 17011', N'Craig Kane', N'nonummy.ut@scelerisquesedsapien.com', N'(0119) 167 1245', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (96, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000096', N'Vel Industries', N'Ante Incorporated', N'', N'1614', N'4479', N'5,29786883907524E+15', N'4,91614878459386E+15', N'', N'Guatemala', N'Bexbach', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Wallace Maddox', N'Donec.consectetuer@tristiquepellentesque.co.uk', N'0386 470 0940', N'Dane Hickman', N'ligula.eu@quismassaMauris.net', N'0500 364497', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (97, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000097', N'Nisl Maecenas Inc.', N'Accumsan Neque Et Limited', N'', N'7690', N'3311', N'5,45234833829317E+15', N'4,02400711673683E+15', N'', N'Portugal', N'Dortmund', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Adam Brown', N'Nunc.mauris@enim.co.uk', N'(01823) 52737', N'Kaseem Lloyd', N'Nulla@adipiscingelit.co.uk', N'0845 46 47', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (98, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000098', N'Sed Consequat Auctor Corporation', N'Vitae Mauris Sit Company', N'', N'5438', N'1273', N'5,41373818205513E+15', N'4,53900947722485E+15', N'', N'Slovakia', N'Merbes-le-Ch‰teau', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Ciaran Bailey', N'tellus.Phasellus@nibh.co.uk', N'07114 709471', N'Daquan Harrison', N'vitae.aliquam.eros@turpis.net', N'07133 825113', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (99, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000099', N'Dictum Phasellus Company', N'Posuere At Velit Industries', N'', N'9141', N'5850', N'5,44327490241935E+15', N'4,71627767829885E+15', N'', N'Congo', N'Fort Collins', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Akeem Horton', N'sem.Nulla@Fuscemollis.org', N'07745 208227', N'Zachery Bird', N'mus.Proin.vel@sed.net', N'0883 580 4923', N'', N'', N'')
GO
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (100, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000100', N'Proin Vel Limited', N'Phasellus Corp.', N'', N'4727', N'9065', N'5,2875949913097E+15', N'4929531032486', N'', N'United States Minor', N'Trochu', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Brady Morse', N'dapibus.ligula.Aliquam@tempusmauriserat.net', N'(025) 3332 4962', N'Alvin Small', N'purus@egestasadui.net', N'(01667) 059139', N'', N'', N'')
INSERT [dbo].[TBL_CariHesaplar] ([c_Record], [c_Guncelleme], [c_Guncelleme_Tarih], [c_Guncelleme_Kullanici], [c_Kayit_Tarih], [c_Kayit_Kullanici], [c_Cari_Kod], [c_Cari_unvan1], [c_Cari_unvan2], [c_Vergi_Dairesi_Ad], [c_Vergi_Dairesi_No], [c_Sicil_No], [c_Iban1], [c_Iban2], [c_Iban3], [c_Ulke], [c_Sehir], [c_Ilce], [c_Adres], [c_Telefon1], [c_Telefon2], [c_Fax1], [c_Fax2], [c_Web], [c_Mail1], [c_Mail2], [c_Yetkili1], [c_Yetkili1_Mail], [c_Yetkili1_Telefon], [c_Yetkili2], [c_Yetkili2_Mail], [c_Yetkili2_Telefon], [c_Yetkili3], [c_Yetkili3_Mail], [c_Yetkili3_Telefon]) VALUES (101, NULL, NULL, NULL, CAST(N'2019-11-01' AS Date), 0, N'0000101', N'Malesuada Augue Corp.', N'Eu Ultrices Sit Industries', N'', N'1712', N'1701', N'5,59502174107576E+15', N'4485884196568', N'', N'Cuba', N'Montegranaro', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'Kenneth Padilla', N'posuere@dolor.com', N'(0151) 636 8859', N'Vernon Patterson', N'augue.ut@consectetuerrhoncusNullam.org', N'0845 46 44', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[TBL_CariHesaplar] OFF
SET IDENTITY_INSERT [dbo].[TBL_Depolar] ON 

INSERT [dbo].[TBL_Depolar] ([d_Record], [d_iptal], [d_Kayit_Tarih], [d_Kayit_Kullanici], [d_Guncelleme], [d_Guncelleme_Kullanici], [d_Guncelleme_Tarih], [d_Firma_no], [d_Sube_no], [d_Depo_Adi], [d_Cadde], [d_Mahalle], [d_Sokak], [d_Semt], [d_Apt_no], [d_Daire_No], [d_Posta_kodu], [d_ilce], [d_il], [d_ulke], [d_ulke_kod], [d_depo_alani], [d_depo_rafhacmi], [d_yetkili_mail], [d_satis_alani], [d_sergi_alani], [d_otopark_alani], [d_otopark_kapasite], [d_kasa_sayisi], [d_kamyon_adedi], [d_tel_ulke_kod], [d_tel_bolge_kod], [d_tel_no1], [d_tel_no2], [d_tel_no3], [d_fax_no1], [d_fax_no2], [d_fax_no3]) VALUES (1, NULL, CAST(N'2019-10-31' AS Date), 0, NULL, NULL, NULL, 1, 1, N'DP-012', N'Caddde', N'Mahalle', N'Sokak ,', N'Semt', N'Apt.', N'Daire', N'Postaa', N'Gaziosmanpaşa', N'İstanbul', N'Türkiye', N'90', 1500, 2500, N'alidmrky@gmail.com', 150.36, 50.87, 850.16, 15, 10, 10, N'+90', N'212', N'25 36', N'25 37', N'25 38', N'25 39', N'25 40', N'25 41')
SET IDENTITY_INSERT [dbo].[TBL_Depolar] OFF
SET IDENTITY_INSERT [dbo].[TBL_Personeller] ON 

INSERT [dbo].[TBL_Personeller] ([p_Record], [p_Iptal], [p_Kayit_Kullanici], [p_Kayit_Tarih], [p_Guncelleme], [p_Guncelleme_Tarih], [p_Guncelleme_Kullanici], [p_Isim], [p_Soyisim], [p_Sicil_No], [p_Firma_No], [p_Sube_No], [p_Departman_Kodu], [p_Ise_Giris_Tarih], [p_Is_Cikis_Tarih], [p_Is_Cikis_Nedeni], [p_Egitim_Durumu], [p_Uyrugu], [p_Medeni_Hali], [p_Kan_Grup], [p_Nuf_Seri_No], [p_Nuf_il], [p_Nuf_ilce], [p_Nuf_Mahalle], [p_Nuf_Koy], [p_Nuf_Cilt_no], [p_Nuf_Sayfa_no], [p_Nuf_Ver_Nedeni], [p_Nuf_Ver_Yer], [p_Nuf_Ver_Tarih], [p_Nuf_Cuz_Kayit_no], [p_Ucret_Tipi], [p_Ucret_Tutarı], [p_adr_Cadde], [p_adr_Mahalle], [p_adr_Sokak], [p_adr_Semt], [p_adr_apatman_no], [p_adr_daire_no], [p_adr_posta_kod], [p_adr_ilce], [p_adr_il], [p_adr_ulke], [p_adr_Ulke_Kod]) VALUES (1, NULL, 0, CAST(N'2019-10-31' AS Date), NULL, NULL, NULL, N'Ali', N'Demirkaya', N'78231', 1, 1, N'ERP', CAST(N'2019-07-18' AS Date), NULL, NULL, N'Lisans-Endüstri Mühendisliği', N'TR', 0, N'B RH -', N'1231', N'İstanbul', N'Avcılar', N'Mahalle', N'Köy', N'123', N'213', N'Yenileme', N'İstanbul', CAST(N'2019-10-08' AS Date), N'2131', 0, 0.0000, N'Cadde', N'Mahalle', N'Sokak ', N'Avcılar', N'1', N'1', N'3410100', N'Beylikdüzü', N'İstanbul', N'Türkiye', N'90')
SET IDENTITY_INSERT [dbo].[TBL_Personeller] OFF
SET IDENTITY_INSERT [dbo].[TBL_Stok] ON 

INSERT [dbo].[TBL_Stok] ([s_Record], [s_iptal], [s_Kayit_Tarih], [s_Kayit_Kullanici], [s_Guncelleme], [s_Guncelleme_kullanici], [s_Guncelleme_Tarih], [s_StokKod], [s_StokAdi], [s_Stok_Kisa_ismi], [s_Stok_Grup_Kodu], [s_Cari_Kodu], [s_Stok_Cinsi], [s_birim1_ad], [s_birim1_katsayi], [s_birim1_agirlik], [s_birim1_en], [s_birim1_boy], [s_birim1_yuksekliik], [s_birim2_ad], [s_birim2_katsayi], [s_birim2_agirlik], [s_birim2_en], [s_birim2_boy], [s_birim2_yuksekliik], [s_birim3_ad], [s_birim3_katsayi], [s_birim3_agirlik], [s_birim3_en], [s_birim3_boy], [s_birim3_yuksekliik], [s_Stok_Min_seviye], [s_Stok_Siparis_seviye], [s_Stok_Max], [s_Stok_ver_sip_birim], [s_Stok_al_sip_birim], [s_Stok_sip_sure], [s_Stok_Garanti_Suresi]) VALUES (1, NULL, CAST(N'2019-11-04' AS Date), 0, NULL, NULL, NULL, N'S0000001', N'X12231AGHSD', N'X723231', N'G0000001', N'0000001', 0, N'ADET', 1, 160, 25, 30, 15, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 15, 15, 20, 10, 1, 10, 24)
SET IDENTITY_INSERT [dbo].[TBL_Stok] OFF
SET IDENTITY_INSERT [dbo].[TBL_Stok_Grupları] ON 

INSERT [dbo].[TBL_Stok_Grupları] ([s_Record], [s_iptal], [s_Kayit_Tarih], [s_Kayit_Kullanici], [s_Guncelleme], [s_Guncelleme_kullanici], [s_Guncelleme_Tarih], [s_Grup_Adi], [s_Grup_Kodu]) VALUES (1, NULL, CAST(N'2019-10-31' AS Date), 0, NULL, NULL, NULL, N'Grup-1', N'G0000001')
INSERT [dbo].[TBL_Stok_Grupları] ([s_Record], [s_iptal], [s_Kayit_Tarih], [s_Kayit_Kullanici], [s_Guncelleme], [s_Guncelleme_kullanici], [s_Guncelleme_Tarih], [s_Grup_Adi], [s_Grup_Kodu]) VALUES (2, NULL, CAST(N'2019-10-31' AS Date), 0, NULL, NULL, NULL, N'Grup-2', N'G0000002')
SET IDENTITY_INSERT [dbo].[TBL_Stok_Grupları] OFF
SET IDENTITY_INSERT [dbo].[TBL_Stok_Hareketleri] ON 

INSERT [dbo].[TBL_Stok_Hareketleri] ([sth_Record], [sth_Kayit_Kullanici], [sth_Kayit_Tarih], [sth_Hareket_Tipi], [sth_Stok_Kayit], [sth_Stok_Kod], [sth_Masraf1], [sth_Masraf2], [sth_Masraf3], [sth_Miktar], [sth_Toplam]) VALUES (1, 0, CAST(N'2019-11-04' AS Date), 0, 1, N'S0000001', 120, 36, 48, 5, 204)
INSERT [dbo].[TBL_Stok_Hareketleri] ([sth_Record], [sth_Kayit_Kullanici], [sth_Kayit_Tarih], [sth_Hareket_Tipi], [sth_Stok_Kayit], [sth_Stok_Kod], [sth_Masraf1], [sth_Masraf2], [sth_Masraf3], [sth_Miktar], [sth_Toplam]) VALUES (2, 0, CAST(N'2019-11-04' AS Date), 1, 1, N'S0000001', 0, 0, 0, 2, 0)
INSERT [dbo].[TBL_Stok_Hareketleri] ([sth_Record], [sth_Kayit_Kullanici], [sth_Kayit_Tarih], [sth_Hareket_Tipi], [sth_Stok_Kayit], [sth_Stok_Kod], [sth_Masraf1], [sth_Masraf2], [sth_Masraf3], [sth_Miktar], [sth_Toplam]) VALUES (3, 0, CAST(N'2019-11-04' AS Date), 1, 1, N'S0000001', 0, 0, 0, 1, 0)
INSERT [dbo].[TBL_Stok_Hareketleri] ([sth_Record], [sth_Kayit_Kullanici], [sth_Kayit_Tarih], [sth_Hareket_Tipi], [sth_Stok_Kayit], [sth_Stok_Kod], [sth_Masraf1], [sth_Masraf2], [sth_Masraf3], [sth_Miktar], [sth_Toplam]) VALUES (4, 0, CAST(N'2019-11-04' AS Date), 1, 1, N'S0000001', 0, 0, 0, 1, 0)
INSERT [dbo].[TBL_Stok_Hareketleri] ([sth_Record], [sth_Kayit_Kullanici], [sth_Kayit_Tarih], [sth_Hareket_Tipi], [sth_Stok_Kayit], [sth_Stok_Kod], [sth_Masraf1], [sth_Masraf2], [sth_Masraf3], [sth_Miktar], [sth_Toplam]) VALUES (5, 0, CAST(N'2019-11-04' AS Date), 1, 1, N'S0000001', 0, 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[TBL_Stok_Hareketleri] OFF
ALTER TABLE [dbo].[TBL_Stok_Hareketleri]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Stok_Hareketleri_TBL_Stok] FOREIGN KEY([sth_Stok_Kayit])
REFERENCES [dbo].[TBL_Stok] ([s_Record])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TBL_Stok_Hareketleri] CHECK CONSTRAINT [FK_TBL_Stok_Hareketleri_TBL_Stok]
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_AnaUrunler]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_AnaUrunler]
(@m_iptal bit,
 @m_Guncelleme nchar(10),
 @m_Olusturan_Kullanici int,
 @m_Olusturulma_Tarih datetime,
 @Ana_Urun_Kodu varchar(100),
 @Ana_Urun_Adi varchar(500),
 @Aciklama varchar(max))
 as
 begin
 Insert into dbo.TBL_AnaUrunler 
 (m_iptal,
 m_Guncelleme,
 m_Olusturan_Kullanici,
 m_Olusturulma_Tarihi,
 Ana_Urun_Kodu,
 Ana_Urun_Adi,
 Aciklama)
 values
 (@m_iptal,
  @m_Guncelleme,
  @m_Olusturan_Kullanici,
  @m_Olusturulma_Tarih,
  @Ana_Urun_Kodu,
  @Ana_Urun_Adi,
  @Aciklama)
  end
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_Cari_Hareketler]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_Cari_Hareketler]
(@c_Kayit_Tarih date,
 @c_Kayit_Kullanici int,
@c_Firma_No int,
 @c_Sube_No int,
 @c_Evrak_Kodu varchar(50),
 @c_Evrak_Seri_No nvarchar(20),
 @c_Evrak_Sira_No int,
 @c_Hareket_Satir_No int,
 @c_Hareket_Tarih datetime,
 @c_Hareket_Tipi tinyint,
 @c_Hareket_Cinsi tinyint,
 @c_Normal_iade tinyint,
 @c_Cari_Pozisyonu tinyint,
 @c_Belge_No nvarchar(20),
 @c_Belge_Tarihi date,
 @c_Aciklama varchar(50),
 @c_Proje_Kodu varchar(25),
 @c_Cari_Kodu varchar(25),
 @c_Cari_Grup_No tinyint,
 @c_Ciro_Cari_Kodu varchar(25),
 @c_Doviz_Cinsi tinyint,
 @c_Doviz_Kuru float,
 @c_Miktar float,
 @c_Meblag float,
 @c_Aratoplam float,
 @c_Vade int,
 @c_Iskonto1 float,
 @c_Iskonto2 float,
 @c_Iskonto3 float,
 @c_Masraf1 float,
 @c_Masraf2 float,
 @c_Masraf3 float)
 as
 begin
 insert into TBL_CariHareketleri(
 c_Kayit_Tarih,
 c_Kayit_Kullanici,
 c_Firma_No,
 c_Sube_No,
 c_Evrak_Kodu,
 c_Evrak_Seri_No,
 c_Evrak_Sıra_No,
 c_Hareket_Satir_No,
 c_Hareket_Tarih,
 c_Hareket_Tipi,
 c_Hareket_Cinsi,
 c_Normal_iade,
 c_Cari_Pozisyonu,
 c_Belge_No,
 c_Belge_Tarihi,
 c_Aciklama,
 c_Proje_Kodu,
 c_Cari_Kodu,
 c_Cari_Grup_No,
 c_Ciro_Cari_Kodu,
 c_Doviz_Cinsi,
 c_Doviz_Kuru,
 c_Miktar,
 c_Meblag,
 c_Aratoplam,
 c_Vade,
 c_Iskonto1,
 c_Iskonto2,
 c_Iskonto3,
 c_Masraf1,
 c_Masraf2,
 c_Masraf3)
 values
 (@c_Kayit_Tarih,
  @c_Kayit_Kullanici,
 @c_Firma_No,
  @c_Sube_No,
  @c_Evrak_Kodu,
  @c_Evrak_Seri_No,
  @c_Evrak_Sira_No,
  @c_Hareket_Satir_No,
  @c_Hareket_Tarih,
  @c_Hareket_Tipi,
  @c_Hareket_Cinsi,
  @c_Normal_iade,
  @c_Cari_Pozisyonu,
  @c_Belge_No,
  @c_Belge_Tarihi,
  @c_Aciklama,
  @c_Proje_Kodu,
  @c_Cari_Kodu,
  @c_Cari_Grup_No,
  @c_Ciro_Cari_Kodu,
  @c_Doviz_Cinsi,
  @c_Doviz_Kuru,
  @c_Miktar,
  @c_Meblag,
  @c_Aratoplam,
  @c_Vade,
  @c_Iskonto1,
  @c_Iskonto2,
  @c_Iskonto3,
  @c_Masraf1,
  @c_Masraf2,
  @c_Masraf3)
end
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_CariHesaplar]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_CariHesaplar]
(@c_Kayit_Tarih date,
 @c_Kayit_Kullanici int,
 @c_Cari_Kod nvarchar(25),
 @c_Cari_unvan1 nvarchar(50),
 @c_Cari_unvan2 nvarchar(50),
 @c_Vergi_Dairesi_ad nvarchar(50),
 @c_Vergi_Dairesi_No nvarchar(50),
 @c_Sicil_No nvarchar(50),
 @c_Iban1 nvarchar(26),
 @c_Iban2 nvarchar(26),
 @c_Iban3 nvarchar(26),
 @c_Ulke nvarchar(20),
 @c_Sehir nvarchar(20),
 @c_Ilce nvarchar(20),
 @c_Adres nvarchar(50),
 @c_Telefon1 nvarchar(16),
 @c_Telefon2 nvarchar(16),
 @c_Fax1 nvarchar(16),
 @c_Fax2 nvarchar(16),
 @c_Web nvarchar(50),
 @c_Mail1 nvarchar(50),
 @c_Mail2 nvarchar(50),
 @c_Yetkili1 nvarchar(50),
 @c_Yetkili1_Mail nvarchar(50),
 @c_Yetkili1_Telefon nvarchar(16),
 @c_Yetkili2 nvarchar(50),
 @c_Yetkili2_Mail nvarchar(50),
 @c_Yetkili2_Telefon nvarchar(16),
 @c_Yetkili3 nvarchar(50),
 @c_Yetkili3_Mail nvarchar(50),
 @c_Yetkili3_Telefon nvarchar(16))
 as
 begin
 insert into dbo.TBL_CariHesaplar
 (c_Kayit_Tarih,
  c_Kayit_Kullanici,
  c_Cari_Kod,
  c_Cari_unvan1,
  c_Cari_unvan2,
  c_Vergi_Dairesi_Ad,
  c_Vergi_Dairesi_No,
  c_Sicil_No,
  c_Iban1,
  c_Iban2,
  c_Iban3,
  c_Ulke,
  c_Sehir,
  c_Ilce,
  c_Adres,
  c_Telefon1,
  c_Telefon2,
  c_Fax1,
  c_Fax2,
  c_Web,
  c_Mail1,
  c_Mail2,
  c_Yetkili1,
  c_Yetkili1_Mail,
  c_Yetkili1_Telefon,
  c_Yetkili2,
  c_Yetkili2_Mail,
  c_Yetkili2_Telefon,
  c_Yetkili3,
  c_Yetkili3_Mail,
  c_Yetkili3_Telefon)
  values
  (@c_Kayit_Tarih,
   @c_Kayit_Kullanici,
   @c_Cari_Kod,
   @c_Cari_unvan1,
   @c_Cari_unvan2,
   @c_Vergi_Dairesi_ad,
   @c_Vergi_Dairesi_No,
   @c_Sicil_No,
   @c_Iban1,
   @c_Iban2,
   @c_Iban3,
   @c_Ulke,
   @c_Sehir,
   @c_Ilce,
   @c_Adres,
   @c_Telefon1,
   @c_Telefon2,
   @c_Fax1,
   @c_Fax2,
   @c_Web,
   @c_Mail1,
   @c_Mail2,
   @c_Yetkili1,
   @c_Yetkili1_Mail,
   @c_Yetkili1_Telefon,
   @c_Yetkili2,
   @c_Yetkili2_Mail,
   @c_Yetkili2_Telefon,
   @c_Yetkili3,
   @c_Yetkili3_Mail,
   @c_Yetkili3_Telefon)
   end
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_Depolar]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_Depolar](
@d_Kayit_Tarih date,
@d_Kayit_Kullanici int,
@d_Firma_No int,
@d_Sube_No int,
@d_Depo_Adi nvarchar(50),
@d_Cadde nvarchar(50),
@d_Mahalle nvarchar(50),
@d_Sokak nvarchar(50),
@d_Semt nvarchar(50),
@d_Apt_No nvarchar(10),
@d_Daire_No nvarchar(10),
@d_Posta_Kodu nvarchar(8),
@d_Ilce nvarchar(15),
@d_Il nvarchar(15),
@d_Ulke nvarchar(15),
@d_Ulke_kod nvarchar(5),
@d_Depo_Alani float,
@d_Depo_Raf_hacmi float,
@d_Yetkili_mail nvarchar(50),
@d_Satis_alani float,
@d_Sergi_Alani float,
@d_Otopark_Alani float,
@d_Otopark_Kapasite int,
@d_Kasa_Sayisi int,
@d_Kamyon_Adedi int,
@d_Tel_Ulke_kod nvarchar(5),
@d_Tel_Bolge_Kod nvarchar(5),
@d_tel_no1 nvarchar(10),
@d_tel_no2 nvarchar(10),
@d_tel_no3 nvarchar(10),
@d_fax_no1 nvarchar(10),
@d_fax_no2 nvarchar(10),
@d_fax_no3 nvarchar(10))
as
begin
insert into dbo.TBL_Depolar
(d_Kayit_Tarih,
 d_Kayit_Kullanici,
 d_Firma_no,
 d_Sube_no,
 d_Depo_Adi,
 d_Cadde,
 d_Mahalle,
 d_Sokak,
 d_Semt,
 d_Apt_no,
 d_Daire_No,
 d_Posta_kodu,
 d_ilce,
 d_il,
 d_ulke,
 d_ulke_kod,
 d_depo_alani,
 d_depo_rafhacmi,
 d_yetkili_mail,
 d_satis_alani,
 d_sergi_alani,
 d_otopark_alani,
 d_otopark_kapasite,
 d_kasa_sayisi,
 d_kamyon_adedi,
 d_tel_ulke_kod,
 d_tel_bolge_kod,
 d_tel_no1,
 d_tel_no2,
 d_tel_no3,
 d_fax_no1,
 d_fax_no2,
 d_fax_no3)
 values
 (@d_Kayit_Tarih,
@d_Kayit_Kullanici,
@d_Firma_No ,
@d_Sube_No ,
@d_Depo_Adi,
@d_Cadde ,
@d_Mahalle ,
@d_Sokak,
@d_Semt ,
@d_Apt_No,
@d_Daire_No ,
@d_Posta_Kodu ,
@d_Ilce ,
@d_Il ,
@d_Ulke ,
@d_Ulke_kod ,
@d_Depo_Alani ,
@d_Depo_Raf_hacmi ,
@d_Yetkili_mail ,
@d_Satis_alani ,
@d_Sergi_Alani ,
@d_Otopark_Alani ,
@d_Otopark_Kapasite ,
@d_Kasa_Sayisi ,
@d_Kamyon_Adedi ,
@d_Tel_Ulke_kod ,
@d_Tel_Bolge_Kod ,
@d_tel_no1 ,
@d_tel_no2 ,
@d_tel_no3 ,
@d_fax_no1 ,
@d_fax_no2 ,
@d_fax_no3)
end
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_Personeller]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_Personeller]
(@p_Kayit_Kullanici int,
 @p_Kayit_Tarih date,
 @p_Isim nvarchar(50),
 @p_Soyisim nvarchar(50),
 @p_Sicil_No nvarchar(50),
 @p_Firma_No int,
 @p_Sube_No int,
 @p_Departman_Kodu varchar(25),
 @p_Ise_Giris_Tarih date,
 @p_Egitim_Durumu varchar(50),
 @p_Uyrugu nvarchar(15),
 @p_Medeni_Hali tinyint,
 @p_Kan_Grup varchar(15),
 @p_Nuf_Seri_No nvarchar(15),
 @p_Nuf_Il nvarchar(20),
 @p_Nuf_Ilce nvarchar(20),
 @p_Nuf_Mahalle nvarchar(20),
 @p_Nuf_Koy nvarchar(20),
 @p_Nuf_Cit_no nvarchar(10),
 @p_Nuf_Sayfa_no nvarchar(20),
 @p_Nuf_Ver_Nedeni nvarchar(20),
 @p_Nuf_Ver_Yer nvarchar(20),
 @p_Nuf_Ver_Tarih date,
 @p_Nuf_Cuz_Kayit_No nvarchar(15),
 @p_Ucret_Tipi tinyint,
 @p_Ucret_Tutarı money,
 @p_Adr_Cadde nvarchar(75),
 @p_Adr_Mahalle nvarchar(75),
 @p_Adr_Sokak nvarchar(75),
 @p_Adr_Semt nvarchar(75),
 @p_Adr_Apartman_No nvarchar(15),
 @p_Adr_Daire_No nvarchar(10),
 @p_Adr_Posta_Kod nvarchar(8),
 @p_Adr_Ilce nvarchar(15),
 @p_Adr_Il nvarchar(20),
 @p_Adr_Ulke nvarchar(15),
 @p_Adr_Ulke_Kod nvarchar(5))
 as
 begin
 insert into dbo.TBL_Personeller(
 p_Kayit_Kullanici,
 p_Kayit_Tarih,
 p_Isim,
 p_Soyisim,
 p_Sicil_No,
 p_Firma_No,
 p_Sube_No,
 p_Departman_Kodu,
 p_Ise_Giris_Tarih,
 p_Egitim_Durumu,
 p_Uyrugu,
 p_Medeni_Hali,
 p_Kan_Grup,
 p_Nuf_Seri_No,
 p_Nuf_il,
 p_Nuf_ilce,
 p_Nuf_Mahalle,
 p_Nuf_Koy,
 p_Nuf_Cilt_no,
 p_Nuf_Sayfa_no,
 p_Nuf_Ver_Nedeni,
 p_Nuf_Ver_Yer,
 p_Nuf_Ver_Tarih,
 p_Nuf_Cuz_Kayit_no,
 p_Ucret_Tipi,
 p_Ucret_Tutarı,
 p_adr_Cadde,
 p_adr_Mahalle,
 p_adr_Sokak,
 p_adr_Semt,
 p_adr_apatman_no,
 p_adr_daire_no,
 p_adr_posta_kod,
 p_adr_ilce,
 p_adr_il,
 p_adr_ulke,
 p_adr_Ulke_Kod)
 values
(@p_Kayit_Kullanici,
 @p_Kayit_Tarih,
 @p_Isim ,
 @p_Soyisim ,
 @p_Sicil_No ,
 @p_Firma_No ,
 @p_Sube_No ,
 @p_Departman_Kodu,
 @p_Ise_Giris_Tarih,
 @p_Egitim_Durumu,
 @p_Uyrugu ,
 @p_Medeni_Hali ,
 @p_Kan_Grup ,
 @p_Nuf_Seri_No ,
 @p_Nuf_Il ,
 @p_Nuf_Ilce,
 @p_Nuf_Mahalle ,
 @p_Nuf_Koy ,
 @p_Nuf_Cit_no ,
 @p_Nuf_Sayfa_no ,
 @p_Nuf_Ver_Nedeni ,
 @p_Nuf_Ver_Yer ,
 @p_Nuf_Ver_Tarih ,
 @p_Nuf_Cuz_Kayit_No ,
 @p_Ucret_Tipi ,
 @p_Ucret_Tutarı ,
 @p_Adr_Cadde ,
 @p_Adr_Mahalle ,
 @p_Adr_Sokak ,
 @p_Adr_Semt,
 @p_Adr_Apartman_No ,
 @p_Adr_Daire_No,
 @p_Adr_Posta_Kod,
 @p_Adr_Ilce,
 @p_Adr_Il,
 @p_Adr_Ulke,
 @p_Adr_Ulke_Kod)
 end
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_Stok_Grupları]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_Stok_Grupları](
@s_Kayit_Tarih date,
@s_Kayit_Kullanici int,
@s_Grup_Adi nvarchar(50),
@s_Grup_Kodu nvarchar(50))
as
begin
insert into dbo.TBL_Stok_Grupları(
s_Kayit_Tarih,
s_Kayit_Kullanici,
s_Grup_Adi,
s_Grup_Kodu)
values
(@s_Kayit_Tarih,
 @s_Kayit_Kullanici,
 @s_Grup_Adi,
 @s_Grup_Kodu)
 end
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_Stok_Hareketleri]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_Stok_Hareketleri]
(@s_Kayit_Kullanici int,
 @s_Kayit_Tarih date,
 @s_Hareket_Tipi tinyint,
 @s_Stok_Kayit bigint,
 @s_Stok_Kod nvarchar(25),
 @s_Masraf1 float,
 @s_Masraf2 float,
 @s_Masraf3 float,
 @s_Miktar float,
 @s_Toplam float)
 as begin
 insert into TBL_Stok_Hareketleri
 (sth_Kayit_Kullanici,
  sth_Kayit_Tarih,
  sth_Hareket_Tipi,
  sth_Stok_Kayit,
  sth_Stok_Kod,
  sth_Masraf1,
  sth_Masraf2,
  sth_Masraf3,
  sth_Miktar,
  sth_Toplam)
  values
  (@s_Kayit_Kullanici,
 @s_Kayit_Tarih ,
 @s_Hareket_Tipi,
 @s_Stok_Kayit ,
 @s_Stok_Kod ,
 @s_Masraf1,
 @s_Masraf2,
 @s_Masraf3,
 @s_Miktar,
 @s_Toplam)
 end 
GO
/****** Object:  StoredProcedure [dbo].[Ekle_TBL_Stoklar]    Script Date: 10.12.2019 09:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ekle_TBL_Stoklar]
(@s_Kayit_Tarihi date,
@s_Kayit_Kullanici int, 
@s_StokKod nvarchar(25),
@s_StokAdi nvarchar(50),
 @s_Stok_Kisa_ismi nvarchar(25),
 @s_Stok_Grup_Kodu nvarchar(25),
 @s_Cari_Kodu nvarchar(25),
 @s_Stok_Cinsi tinyint,
 @s_birim1_ad nvarchar(10),
 @s_birim1_Katsayi float,
 @s_birim1_agirlik float,
 @s_birim1_en float,
 @s_birim1_boy float,
 @s_birim1_yukseklik float,
 @s_birim2_ad nvarchar(10),
 @s_birim2_Katsayi float,
 @s_birim2_agirlik float,
 @s_birim2_en float,
 @s_birim2_boy float,
 @s_birim2_yukseklik float,
 @s_birim3_ad nvarchar(10),
 @s_birim3_Katsayi float,
 @s_birim3_agirlik float,
 @s_birim3_en float,
 @s_birim3_boy float,
 @s_birim3_yukseklik float,
 @s_Stok_Min_seviye float,
 @s_Stok_Siparis_seviye float,
 @s_Stok_Max float,
 @s_Stok_ver_sip_birim tinyint,
 @s_Stok_al_sip_birim tinyint,
 @s_Stok_sip_sure smallint,
 @s_Stok_Garanti_suresi smallint)
 as
 begin
 insert into TBL_Stok
 (s_Kayit_Tarih,
  s_Kayit_Kullanici,
  s_StokKod,
  s_StokAdi,
  s_Stok_Kisa_ismi,
  s_Stok_Grup_Kodu,
  s_Cari_Kodu,
  s_Stok_Cinsi,
  s_birim1_ad,
  s_birim1_katsayi,
  s_birim1_agirlik,
  s_birim1_en,
  s_birim1_boy,
  s_birim1_yuksekliik,
  s_birim2_ad,
  s_birim2_katsayi,
  s_birim2_agirlik,
  s_birim2_en,
  s_birim2_boy,
  s_birim2_yuksekliik,
  s_birim3_ad,
  s_birim3_katsayi,
  s_birim3_agirlik,
  s_birim3_en,
  s_birim3_boy,
  s_birim3_yuksekliik,
  s_Stok_Min_seviye,
  s_Stok_Siparis_seviye,
  s_Stok_Max,
  s_Stok_ver_sip_birim,
  s_Stok_al_sip_birim,
  s_Stok_sip_sure,
  s_Stok_Garanti_Suresi)
  values
(@s_Kayit_Tarihi ,
 @s_Kayit_Kullanici ,
 @s_StokKod ,
 @s_StokAdi ,
 @s_Stok_Kisa_ismi ,
 @s_Stok_Grup_Kodu ,
 @s_Cari_Kodu ,
 @s_Stok_Cinsi,
 @s_birim1_ad ,
 @s_birim1_Katsayi ,
 @s_birim1_agirlik ,
 @s_birim1_en ,
 @s_birim1_boy ,
 @s_birim1_yukseklik ,
 @s_birim2_ad,
 @s_birim2_Katsayi ,
 @s_birim2_agirlik ,
 @s_birim2_en,
 @s_birim2_boy,
 @s_birim2_yukseklik ,
 @s_birim3_ad ,
 @s_birim3_Katsayi,
 @s_birim3_agirlik,
 @s_birim3_en,
 @s_birim3_boy,
 @s_birim3_yukseklik,
 @s_Stok_Min_seviye,
 @s_Stok_Siparis_seviye,
 @s_Stok_Max,
 @s_Stok_ver_sip_birim,
 @s_Stok_al_sip_birim,
 @s_Stok_sip_sure,
 @s_Stok_Garanti_suresi)
 end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TBL_Stok"
            Begin Extent = 
               Top = 7
               Left = 49
               Bottom = 327
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 27
         End
         Begin Table = "TBL_Stok_Hareketleri"
            Begin Extent = 
               Top = 7
               Left = 341
               Bottom = 327
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_StokHareketler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_StokHareketler'
GO
