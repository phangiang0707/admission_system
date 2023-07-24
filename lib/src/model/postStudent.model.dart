// To parse this JSON data, do
//
//     final postStudentOtd = postStudentOtdFromJson(jsonString);

import 'dart:convert';

PostStudentOtd postStudentOtdFromJson(String str) =>
    PostStudentOtd.fromJson(json.decode(str));

String postStudentOtdToJson(PostStudentOtd data) => json.encode(data.toJson());

class PostStudentOtd {
  String maHocSinh;
  String hoVaTenDem;
  String ten;
  bool gioiTinh;
  DateTime ngaySinh;
  String noiSinh;
  String queQuan;
  String diaChiThuongTru;
  String ngheDangKy;
  String lop;
  String sdtHocSinh;
  String sdtLienLac;
  String trinhDo;
  String giayCntnTruong;
  String hocLuc;
  String hanhKiem;
  String diemTongKetLop9;
  String namTotNghiep;
  String diaChiLienLac;
  String danToc;
  String tonGiao;
  String doiTuong;
  String khuVuc;
  String cccd;
  DateTime ngayCap;
  String noiCap;
  String hoTenCha;
  String hoTenMe;
  String ghiChu;

  PostStudentOtd({
    required this.maHocSinh,
    required this.hoVaTenDem,
    required this.ten,
    required this.gioiTinh,
    required this.ngaySinh,
    required this.noiSinh,
    required this.queQuan,
    required this.diaChiThuongTru,
    required this.ngheDangKy,
    required this.lop,
    required this.sdtHocSinh,
    required this.sdtLienLac,
    required this.trinhDo,
    required this.giayCntnTruong,
    required this.hocLuc,
    required this.hanhKiem,
    required this.diemTongKetLop9,
    required this.namTotNghiep,
    required this.diaChiLienLac,
    required this.danToc,
    required this.tonGiao,
    required this.doiTuong,
    required this.khuVuc,
    required this.cccd,
    required this.ngayCap,
    required this.noiCap,
    required this.hoTenCha,
    required this.hoTenMe,
    required this.ghiChu,
  });

  factory PostStudentOtd.fromJson(Map<String, dynamic> json) => PostStudentOtd(
        maHocSinh: json["ma_hoc_sinh"],
        hoVaTenDem: json["ho_va_ten_dem"],
        ten: json["ten"],
        gioiTinh: json["gioi_tinh"],
        ngaySinh: DateTime.parse(json["ngay_sinh"]),
        noiSinh: json["noi_sinh"],
        queQuan: json["que_quan"],
        diaChiThuongTru: json["dia_chi_thuong_tru"],
        ngheDangKy: json["nghe_dang_ky"],
        lop: json["lop"],
        sdtHocSinh: json["sdt_hoc_sinh"],
        sdtLienLac: json["sdt_lien_lac"],
        trinhDo: json["trinh_do"],
        giayCntnTruong: json["giay_cntn_truong"],
        hocLuc: json["hoc_luc"],
        hanhKiem: json["hanh_kiem"],
        diemTongKetLop9: json["diem_tong_ket_lop_9"],
        namTotNghiep: json["nam_tot_nghiep"],
        diaChiLienLac: json["dia_chi_lien_lac"],
        danToc: json["dan_toc"],
        tonGiao: json["ton_giao"],
        doiTuong: json["doi_tuong"],
        khuVuc: json["khu_vuc"],
        cccd: json["cccd"],
        ngayCap: DateTime.parse(json["ngay_cap"]),
        noiCap: json["noi_cap"],
        hoTenCha: json["ho_ten_cha"],
        hoTenMe: json["ho_ten_me"],
        ghiChu: json["ghi_chu"],
      );

  Map<String, dynamic> toJson() => {
        "ma_hoc_sinh": maHocSinh,
        "ho_va_ten_dem": hoVaTenDem,
        "ten": ten,
        "gioi_tinh": gioiTinh,
        "ngay_sinh": ngaySinh.toIso8601String(),
        "noi_sinh": noiSinh,
        "que_quan": queQuan,
        "dia_chi_thuong_tru": diaChiThuongTru,
        "nghe_dang_ky": ngheDangKy,
        "lop": lop,
        "sdt_hoc_sinh": sdtHocSinh,
        "sdt_lien_lac": sdtLienLac,
        "trinh_do": trinhDo,
        "giay_cntn_truong": giayCntnTruong,
        "hoc_luc": hocLuc,
        "hanh_kiem": hanhKiem,
        "diem_tong_ket_lop_9": diemTongKetLop9,
        "nam_tot_nghiep": namTotNghiep,
        "dia_chi_lien_lac": diaChiLienLac,
        "dan_toc": danToc,
        "ton_giao": tonGiao,
        "doi_tuong": doiTuong,
        "khu_vuc": khuVuc,
        "cccd": cccd,
        "ngay_cap": ngayCap.toIso8601String(),
        "noi_cap": noiCap,
        "ho_ten_cha": hoTenCha,
        "ho_ten_me": hoTenMe,
        "ghi_chu": ghiChu,
      };
}
