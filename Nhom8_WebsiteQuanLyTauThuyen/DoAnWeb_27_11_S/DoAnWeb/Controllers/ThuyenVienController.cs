using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWeb.Models;


namespace DoAnWeb.Controllers
{
    public class ThuyenVienController : Controller
    {
        //
        // GET: /ThuyenVien/
        DBDataContext db = new DBDataContext();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ThongTinCaNhan()//tuong tu nhu chi tiet san pham trorng bai ktra
        {
            int id = int.Parse(Session["id"].ToString());
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(t => t.id==id);
            return View(nv);//hien thi thong tin thuyen vien
        }
        public ActionResult XemToaDo()
        {
            NHANVIEN nv = Session["login"] as NHANVIEN;
            TOADOTAU toado = db.TOADOTAUs.SingleOrDefault(t => t.matau.Trim() == nv.matau);
            return View(toado);//tra ve bang thong tin xem toa do tau hien ta
        }
        public ActionResult ThuyenVien()
        {
            if (Session["login"] != null)
            {
                NHANVIEN nv = Session["login"] as NHANVIEN;
                List<NHANVIEN> list = db.NHANVIENs.Where(t => t.matau == nv.matau).ToList();
                ViewBag.matau = nv.matau;
                return View(list);
            }
            if (Session["admin"] != null)
            {
                NHANVIEN nv = Session["admin"] as NHANVIEN;
                List<NHANVIEN> list = db.NHANVIENs.Where(t => t.matau == nv.matau &&t.id!=nv.id).ToList();
                ViewBag.matau = nv.matau;

                return View(list);
            }
            return View();//tra ve trang thong tin thuyen hien tai cua thuyen vien
        }

        [HttpPost]
        public ActionResult ThuyenVien(FormCollection f)
        {
            if (Session["login"] != null)
            {
                NHANVIEN nv = Session["login"] as NHANVIEN;
                List<NHANVIEN> list = db.NHANVIENs.Where(t => t.matau == nv.matau).ToList();
                ViewBag.matau = nv.matau;
                return View(list);
            }
            if (Session["admin"] != null)
            {
                NHANVIEN nv = Session["admin"] as NHANVIEN;
                List<NHANVIEN> list = db.NHANVIENs.Where(t => t.matau == nv.matau && t.id != nv.id).ToList();
                ViewBag.matau = nv.matau;

                return View(list);
            }
            return View();//tra ve trang thong tin thuyen hien tai cua thuyen vien
        }

        [HttpGet]
        public ActionResult XemToaDoThuyenTruong()//kiem tra login neu la thuyen truong thi hien thi
        {
            NHANVIEN nv = Session["admin"] as NHANVIEN;
            List<TOADOTAU> list = db.TOADOTAUs.Where(t => t.matau.Trim() == nv.matau).OrderByDescending(t => t.thoigian).ToList();
            TOADOTAU toado = list.Take(1).First(t => t.thoigian != null);
            return View(toado);
        }
        [HttpPost]
        public ActionResult XemToaDoThuyenTruong(FormCollection f)
        {
            NHANVIEN nv = Session["admin"] as NHANVIEN;
            List<TOADOTAU> list = db.TOADOTAUs.Where(t => t.matau.Trim() == nv.matau).OrderByDescending(t=>t.thoigian).ToList();
            TOADOTAU toado = list.Take(1).First(t => t.thoigian!=null);
            var kinhdo = f["txtKinhDo"];
            var vido = f["txtViDo"];
            if(kinhdo !=null && vido != null)
            {
                TOADOTAU newToado = new TOADOTAU();
                newToado.matau = nv.matau;
                newToado.thoigian = DateTime.Now;
                newToado.latutude = vido;
                newToado.longitude = kinhdo;
                db.TOADOTAUs.InsertOnSubmit(newToado);
                db.SubmitChanges();
            }
            return View(toado);//tra ve bang thong tin xem toa do tau hien tai
        }
    }
}
