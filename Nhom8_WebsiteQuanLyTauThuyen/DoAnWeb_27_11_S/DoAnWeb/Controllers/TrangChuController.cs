using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWeb.Models;
using System.Web.Helpers;
using Mail;

namespace DoAnWeb.Controllers
{
    public class TrangChuController : Controller
    {
        //
        // GET: /TrangChu/
        DBDataContext db = new DBDataContext();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TrangChu()
        {
            return View();//tra ve thong tin trang chu la 1 tin tuc co dinh ve cong ty
        }
        public ActionResult TinTuc()
        {
            List<loaitin> list = db.loaitins.OrderByDescending(t => t.maloai).ToList();
            return PartialView(list);//tra ve danh sach tin tuc doc tu csdl
        }

        public ActionResult ChiTietTinTuc(int? maloai)
        {
            loaitin tin = db.loaitins.SingleOrDefault(t => t.maloai == maloai);
            List<chitiettin> list = db.chitiettins.Where(t => t.maloai == maloai).ToList();
            ViewBag.tieude = tin.tenloai;
            return View(list);//tra ve danh sach tin tuc doc tu csdl
        }


        public ActionResult ThoiTiet()
        {
            return View();//tra ve bang cac thong tin thoi tiet theo khu vuc
        }
        [HttpGet]
        public ActionResult LienHe()
        {
            return View();//tra ve thong tin trang lien he
        }
        [HttpPost]
        public ActionResult LienHe(FormCollection f)
        {
            var mail = f["txtmail"];
            var noidung = f["txtcontent"];
            if (mail.Length > 0 && noidung.Length > 0)
            {
                string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/FormMail/Mail.html"));
                content = content.Replace("{{mail}}", mail);
                content = content.Replace("{{tennv}}", mail);
                content = content.Replace("{{noidung}}", noidung);
                new MailHelper().sendMail(mail, "Hello", content);
                ViewBag.thongbao = "Gui thanh cong";
            }
            return View();//tra ve thong tin trang lien he
        }
        public ActionResult TimKiem(FormCollection f)
        {
            var s = f["txtTim"];
            List<chitiettin> list = db.chitiettins.Where(t => t.noidung.Contains(s)).ToList();
            if (list == null)
            {
                ViewBag.thongbao = "khong tim thay !";
            }
            else
            {
                ViewBag.thongbao = "san pham ban tim !" + s;
            }

            return View(list);//tra ve thong tin tim kiem theo noi dung/tieu de tin tuc
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();//tra ve trang dang nhap he thong
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            var user_name = f["txttk"];
            var password = f["txtpass"];

            if (string.IsNullOrEmpty(user_name))
                ViewData["errUsername"] = " Username is required !";
            if (string.IsNullOrEmpty(password))
                ViewData["errPass"] = " Password is required !";
            if (!string.IsNullOrEmpty(user_name) && !string.IsNullOrEmpty(password))
            {
                TAIKHOAN admin = db.TAIKHOANs.SingleOrDefault(t => t.tendangnhap == user_name && t.matkhau == password);
                if (admin != null)
                {
                    NHANVIEN nv = db.NHANVIENs.SingleOrDefault(t => t.id == admin.id);
                    Session["loai"] = nv.maloai.Trim();
                    Session["admin"] = nv;
                    Session["login"] = nv;
                    Session["id"] = nv.id;
                    return RedirectToAction("TrangChu", "TrangChu");
                }
                else
                {
                    Response.Write("<script>alert('Tài Khoản hoặc mật khẩu không đúng !!!')</script>");

                }
            }
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["loai"] = null;
            Session["admin"] = null;
            Session["thuyenvien"] = null;
            Session["login"] = null;

            return RedirectToAction("DangNhap", "TrangChu");
        }
    }
}
