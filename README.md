# 📄 Báo Cáo Khoa Học MMDBMS - STT (LaTeX)

> **XÂY DỰNG HỆ THỐNG CHUYỂN ĐỔI ÂM THANH THÀNH VĂN BẢN TIẾNG VIỆT TRÊN NỀN TẢNG CƠ SỞ DỮ LIỆU ĐA PHƯƠNG TIỆN KẾT HỢP WHISPERX VÀ CHỈ MỤC VECTOR ÂM HỌC FAISS**

Bài báo khoa học thuộc học phần **Hệ Quản trị Cơ sở Dữ liệu Đa phương tiện (MMDBMS)** — Trường Đại học Kỹ thuật - Công nghệ Cần Thơ (CTUT).

---

## 👥 Nhóm Tác Giả

- **Nguyễn Trần Anh Khoa** (Tác giả liên hệ: `ntakhoahttt2211026@student.ctuet.edu.vn`)
- **Nguyễn Quốc Dửng**
- **Nguyễn Thành Đạt**

---

## 📂 Cấu Trúc Thư Mục

```text
bao-cao/
├── .gitignore               # Cấu hình lọc file phụ trợ LaTeX và file nhị phân
├── baocao_format.sty        # Định dạng chuẩn bài báo hội nghị/khoa học CTUT
├── bao_cao_mmdbms.tex       # Mã nguồn LaTeX chính của bài báo
├── bao_cao_mmdbms.bib       # Danh mục tài liệu tham khảo (BibTeX)
├── bao_cao_mmdbms.pdf       # Bản PDF xuất bản hoàn chỉnh
├── clean_latex.sh           # Script dọn dẹp file build phụ trợ
├── latexmkrc                # Cấu hình biên dịch tự động bằng latexmk
├── kien_truc_he_thong.puml  # Mã nguồn sơ đồ kiến trúc hệ thống (PlantUML)
├── kien_truc_he_thong.png   # Ảnh sơ đồ kiến trúc xuất bản
└── yeucau/                  # Đề bài và quy định trình bày của học phần
```

---

## ⚙️ Hướng Dẫn Biên Dịch (Compile)

### 1. Yêu cầu môi trường
- Bộ biên dịch TeX: **TeX Live** (khuyến nghị bản 2024+ hoặc mới nhất) hoặc **MiKTeX**.
- Trình biên dịch: `pdflatex` (hỗ trợ font T5 tiếng Việt chuẩn gói `vietnam`).

### 2. Biên dịch nhanh bằng dòng lệnh
```bash
# Biên dịch qua pdflatex + bibtex
pdflatex bao_cao_mmdbms.tex
bibtex bao_cao_mmdbms
pdflatex bao_cao_mmdbms.tex
pdflatex bao_cao_mmdbms.tex
```

Hoặc dùng `latexmk`:
```bash
latexmk -pdf bao_cao_mmdbms.tex
```

### 3. Dọn dẹp file phụ trợ sau khi build
```bash
bash clean_latex.sh
# Hoặc trên Windows PowerShell:
Remove-Item *.aux, *.bbl, *.blg, *.log, *.out, *.synctex.gz, *.fdb_latexmk, *.fls -Force -ErrorAction SilentlyContinue
```
