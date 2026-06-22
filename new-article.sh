#!/usr/bin/env bash
# Создаёт новую папку статьи с заготовками ru/en/pt, подключёнными к ../styles.css
# Использование: ./new-article.sh <slug>
# Пример:        ./new-article.sh position-sizing-crypto

set -euo pipefail

slug="${1:-}"
if [[ -z "$slug" ]]; then
  echo "Укажи slug статьи: ./new-article.sh <slug>"
  exit 1
fi
if [[ -d "$slug" ]]; then
  echo "Папка '$slug' уже существует — останавливаюсь, чтобы ничего не перезаписать."
  exit 1
fi

mkdir -p "$slug"
for lang in ru en pt; do
  cat > "$slug/$lang.html" <<HTML
<!DOCTYPE html>
<html lang="$lang">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TODO: заголовок ($lang)</title>
<meta name="description" content="TODO: описание ($lang)">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Onest:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../styles.css">
</head>
<body>
<div class="t-article-wrapper">
  <div class="t-container">
    <div class="article-content">
      <!-- TODO: собрать статью по правилам CLAUDE.md -->
    </div>
  </div>
</div>
</body>
</html>
HTML
done

echo "Создано: $slug/{ru,en,pt}.html (подключены к ../styles.css)"
echo "Не забудь добавить статью в README.txt."
