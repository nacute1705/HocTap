package com.example.shopquanao.ultil;

public class Server {
    //public static String localhost="192.168.0.123";//wifi nhà
    //public static String localhost="192.168.1.169";//wifi ngoài
    //public static String localhost="192.168.1.27";//wifi ngoài
    //public static String localhost="172.20.10.12";//wifi đt
    public static String localhost="192.168.120.49";//wifi đt
    public static String DuongdanLoaisp= "http://" + localhost + ":2001/server/getloaisanpham.php";
    public static String Duongdansanphammoinhat= "http://" + localhost + ":2001/server/getsanphammoinhat.php";
    public static String Duongdanquanao= "http://" + localhost + ":2001/server/getsanpham.php?page=";
    public static String Duongdanphukien= "http://" + localhost + ":2001/server/getphukien.php?page=";
    public static String Duongdandonhang= "http://" + localhost + ":2001/server/thongtinkhachhang.php";
    public static String Duongdanchitietdonhang= "http://" + localhost + ":2001/server/chitietdonhang.php";

}
