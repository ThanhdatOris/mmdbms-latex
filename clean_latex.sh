#!/usr/bin/env bash
set -Eeuo pipefail

# Xóa các file phụ trợ sinh bởi XeLaTeX/latexmk cho bài báo.
# Mặc định giữ lại file .tex và PDF kết quả.
#
# Cách dùng:
#   bash clean_latex.sh              # xóa file phụ trợ
#   bash clean_latex.sh --dry-run    # chỉ liệt kê file sẽ xóa
#   bash clean_latex.sh --all        # xóa thêm PDF kết quả

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MAIN_BASENAME="bao_cao_mmdbms"
DRY_RUN=0
REMOVE_PDF=0

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --all) REMOVE_PDF=1 ;;
    -h|--help)
      sed -n '1,14p' "$0"
      exit 0
      ;;
    *)
      printf 'Tham số không hợp lệ: %s\n' "$arg" >&2
      exit 2
      ;;
  esac
done

TARGETS=()
for ext in aux fdb_latexmk fls log out xdv synctex.gz toc lof lot bbl blg bcf run.xml nav snm vrb; do
  TARGETS+=("$SCRIPT_DIR/$MAIN_BASENAME.$ext")
done

if (( REMOVE_PDF )); then
  TARGETS+=("$SCRIPT_DIR/$MAIN_BASENAME.pdf")
fi

removed=0
for target in "${TARGETS[@]}"; do
  if [[ -e "$target" ]]; then
    if (( DRY_RUN )); then
      printf 'Would remove: %s\n' "$target"
    else
      rm -f -- "$target"
      printf 'Removed: %s\n' "$target"
    fi
    ((removed += 1))
  fi
done

if (( DRY_RUN )); then
  printf 'Dry run: %d file(s) matched.\n' "$removed"
else
  printf 'Clean complete: %d file(s) removed.\n' "$removed"
fi
