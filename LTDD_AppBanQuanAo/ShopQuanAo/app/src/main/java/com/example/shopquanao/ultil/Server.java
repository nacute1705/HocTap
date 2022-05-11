package com.example.shopquanao.ultil;

public class Server {
    public static String localhost="192.168.0.105";//wifi nhà
    //public static String localhost="192.168.1.169";//wifi ngoài
    //public static String localhost="192.168.1.28";//wifi ngoài

    //public static String localhost="192.168.120.49";//wifi đt
    public static String DuongdanLoaisp= "http://" + localhost + ":2001/server/getloaisanpham.php";
    public static String Duongdansanphammoinhat= "http://" + localhost + ":2001/server/getsanphammoinhat.php";
    public static String Duongdanquanao= "http://" + localhost + ":2001/server/getsanpham.php?page=";
    public static String Duongdanphukien= "http://" + localhost + ":2001/server/getphukien.php?page=";

}
