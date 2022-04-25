using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWeb.Models;

namespace DoAnWeb.Controllers
{
    public class NhanVienController : Controller
    {
        //
        // GET: /NhanVien/
        DBDataContext db = new DBDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ChiTietNhanVien(int? id)
        {
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(t=>t.id==id);
            return View(nv);//tra ve thong tin ca nhan cua nhan vien
        }
        [HttpGet]
        public ActionResult TaoTin()
        {
            return View();//tra ve bang nhap tin tuc len web
        }
        [HttpPost]
        public ActionResult TaoTin(FormCollection f)
        {
            
            var loaitin = f["txtLoaiTin"];
            var tieude = f["txttitle"];
            var noidung = f["txtContent"];
            var anh = f["txtfile"];
            var link = f["txtlink"];
            if(loaitin.Length>0 && tieude.Length>0 && noidung.Length>0 && anh!=null&&link.Length>0)
            {
                
                //string filename = System.IO.Path.GetFileName(anh);
                //string url = Server.MapPath("~/Assets/Image/TinTuc/" + filename);
                //image.SaveAs(url);
                chitiettin tin = new chitiettin();
                tin.maloai = Convert.ToInt32(db.chitiettins.Where(t=>t.matin>0).Count()+1);
                tin.tieude = tieude;
                tin.noidung = noidung;
                tin.ngaydang = DateTime.Now;
                tin.maloai = Convert.ToInt32(loaitin);
                tin.anh = anh;
                tin.link = link;
                db.chitiettins.InsertOnSubmit(tin);
                db.SubmitChanges();
                return RedirectToAction("TrangChu","TrangChu");

            }
            ViewBag.thongbao = "Loi Tao Tin";
            return View();//tra ve bang nhap tin tuc len web
        }
        [HttpGet]
        public ActionResult ThemNhanVien(string matau)
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemNhanVien(FormCollection f, string matau)
        {
            var hoten = f["txtHoten"];
            var ngaysinh = f["txtdate"];
            var diachi = f["txtdiachi"];
            var bhxh = f["txtbhxh"];
            var cc = f["txtcc"];
            var chucvu = f["txtchucvu"];
            if (hoten.Length > 0 && ngaysinh.Length > 0 && diachi.Length > 0 && bhxh.Length>0 &&cc.Length>0 && chucvu.Length>0)
            {
                NHANVIEN nv = new NHANVIEN();
                nv.id =(db.NHANVIENs.Max(t => t.id+ 1));
                nv.hoten = hoten;
                nv.ngaysinh = DateTime.Parse(ngaysinh);
                nv.diachi = diachi;
                nv.mabhxh = bhxh;
                nv.matau = matau;
                nv.cccd = cc;
                nv.maloai = chucvu;
                db.NHANVIENs.InsertOnSubmit(nv);
                db.SubmitChanges();
                Response.Write("<script>alert('Thêm Thành Công!!!')</script>");

            }
            else
            {
                Response.Write("<script>alert('Vui Lòng Điền Đầy Đủ Thông Tin !!!')</script>");

            }
            return View();//tra ve bang nhap tin tuc len web
        }
        public ActionResult XoaNhanVien(int? id)
        {
            NHANVIEN del = db.NHANVIENs.SingleOrDefault(t => t.id == id);
            if (del != null)
            {
                db.NHANVIENs.DeleteOnSubmit(del);
                db.SubmitChanges();
                Response.Write("<script>alert('Xóa Thành Công!!!')</script>");
            }
            return RedirectToAction("ThuyenVien", "ThuyenVien");
        }

    }
}
