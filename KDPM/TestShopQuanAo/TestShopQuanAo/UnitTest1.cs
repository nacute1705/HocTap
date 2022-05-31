using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

namespace TestShopQuanAo
{
    [TestClass]
    public class UnitTest1
    {
        //[TestMethod]
        //public void TestMethod1()
        //{
        //    KhongNhapUsernameTest khongNhapUsernameTest = new KhongNhapUsernameTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.khongNhapUsername();
        //    khongNhapUsernameTest.TearDown();
        //}

        //[TestMethod]
        //[DataTestMethod]
        //[DynamicData(nameof(TestData_DangKy), DynamicDataSourceType.Method)]
        //public void TestMethod2(string pUsername, string pPw, string pRpw, string pHoTen, string pNgSinh, string pEmail, string pSDT, string pDiaChi, int pTask, string pKq = "")
        //{
        //    TestDangKy khongNhapUsernameTest = new TestDangKy();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.dangKy(pUsername, pPw, pRpw, pHoTen, pNgSinh, pEmail, pSDT, pDiaChi, pTask, pKq);
        //    khongNhapUsernameTest.TearDown();
        //}
        //[TestMethod]
        //[DataTestMethod]
        //[DynamicData(nameof(TestData_DangKy), DynamicDataSourceType.Method)]
        //public void TestMethod3(string pUsername, string pPw, string pRpw, string pHoTen, string pNgSinh, string pEmail, string pSDT, string pDiaChi)
        //{
        //    TCDNTCTest khongNhapUsernameTest = new TCDNTCTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.tCDNTC(pUsername, pPw, pRpw, pHoTen, pNgSinh, pEmail, pSDT, pDiaChi);
        //    khongNhapUsernameTest.TearDown();
        //}
        //#region bộ dữ liệu test
        //static IEnumerable<object[]> TestData_DangKy()
        //{
        //    //yield return new Object[] { "123", string.Empty, "na123456", "Lê Văn A", string.Empty, "a@gmail.com", string.Empty, "TP", 1 }; // nhập thiếu
        //    //yield return new Object[] { string.Empty, "na123457", "na123456", "Lê Thùy Na", "17/05/2001", "na@gmail.com", "0364567809", "TB", 2, "Enter username" }; // tên đăng nhập bỏ trống
        //    //yield return new Object[] { "tam",  "123", "123","Đức Tâm", "11/12/2001", "tam@gmail.com", "0364567809", "TB", 3,"Mật khẩu phải có ít nhất 1 số, 1 kí tự và có độ dài ít nhất là 8 và tối đa là 20 kí tự" }; // mk ngan
        //    //yield return new Object[] { "123", "na123457", "na123456", "Lê Văn A", "11/05/199", "a@gmail.com", "0364567809", "TP", 4, "Vui lòng nhập vào nhập lại mật khẩu" }; // repw sai
        //    //yield return new Object[] { "phuong",  "phuong123", "phuong123", string.Empty, "1/1/2001", "Phuong@gmail.com", "0364567809", "TB",5,"Vui lòng nhập vào họ tên"  }; // để trống họ tên
        //    //yield return new Object[] { "phuong",  "phuong123", "phuong123","Lê Huỳnh Nam", string.Empty, "Phuong@gmail.com", "0364567809", "TB",6,"Vui lòng nhập vào ngày tháng năm sinh"  }; // để trống họ tên
        //    //yield return new Object[] { "tai",  "tai12345", "tai12345","Đinh Phát Tài", "30/05/2001", "taigmail.com", "0364567809", "TB",7,"Địa chỉ email của bạn không đúng định dạng!" }; // nhập sai định dạng email
        //    //yield return new Object[] { "phuong",  "phuong123", "phuong123", "Trần Trọng Bình Phương", "1/1/2001", "Phuong@gmail.com", "a364567809", "TB",8,"Số điện thoại của bạn không đúng định dạng"  }; // nhập sai định dạng sdt


        //    yield return new Object[] { "na12345", "na17052001", "na17052001", "Lê Thùy Na", "17/05/2001", "nalethuy@gmail.com", "0362417182", "Tân Bình" }; // nhập đúng

        //}
        //#endregion
        //[TestMethod]
        //public void TestMethod4()
        //{
        //    TestDNKhongNhapGiTest khongNhapUsernameTest = new TestDNKhongNhapGiTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.testDNKhongNhapGi();
        //    khongNhapUsernameTest.TearDown();
        //}
        //[TestMethod]
        //public void TestMethod5()
        //{
        //    TestDNKhongNhapGiTest khongNhapUsernameTest = new TestDNKhongNhapGiTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.testDNKhongNhapUsername();
        //    khongNhapUsernameTest.TearDown();
        //}
        //[TestMethod]
        //public void TestMethod6()
        //{
        //    TestDNKhongNhapGiTest khongNhapUsernameTest = new TestDNKhongNhapGiTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.testDNKhongNhapPass();
        //    khongNhapUsernameTest.TearDown();
        //}
        //[TestMethod]
        //public void TestMethod7()
        //{
        //    TestDNKhongNhapGiTest khongNhapUsernameTest = new TestDNKhongNhapGiTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.testDNSai();
        //    khongNhapUsernameTest.TearDown();
        //}
        //[TestMethod]
        //[DataTestMethod]
        //[DynamicData(nameof(TestData_DangNhap), DynamicDataSourceType.Method)]
        //public void TestMethod8(string pUsername, string pPw)
        //{
        //    TestDNFullTest khongNhapUsernameTest = new TestDNFullTest();
        //    khongNhapUsernameTest.SetUp();
        //    khongNhapUsernameTest.testDNFull(pUsername, pPw);
        //    khongNhapUsernameTest.TearDown();
        //}

        //#region bộ dữ liệu test
        //static IEnumerable<object[]> TestData_DangNhap()
        //{
        //    yield return new Object[] { "TK001", "123"}; // nhập đúng
        //    yield return new Object[] { "TK002", "123" }; // nhập đúng
        //    yield return new Object[] { "TK003", "123" }; // nhập đúng

        //}
        //#endregion
        [TestMethod]
        public void TestMethod9()
        {
            TestMuaHangTCTest khongNhapUsernameTest = new TestMuaHangTCTest();
            khongNhapUsernameTest.SetUp();
            khongNhapUsernameTest.testMuaHangTC();
            khongNhapUsernameTest.TearDown();
        }
        [TestMethod]
        public void TestMethod10()
        {
            ThanhToanTest khongNhapUsernameTest = new ThanhToanTest(); 
            khongNhapUsernameTest.SetUp();
            khongNhapUsernameTest.thanhToan();
            khongNhapUsernameTest.TearDown();
        }
    }

}
