# Hash Hedge — Блог: правила проекта (для Claude Code)

Этот файл — контекст для Claude Code. Прочитай его перед любой работой со статьями.
Здесь зафиксированы структура проекта, правила вёрстки статей и принятые договорённости.

---

## 1. Назначение

Генерация HTML-страниц статей для блога Hash Hedge (крипто проп-трейдинговая
платформа). Каждая статья делается в нескольких языковых версиях. Вёрстка
строго следует спецификации `docs/article-generator-spec.json`
(`hash_hedge_article_generator_strict_v20`).

## 2. Структура репозитория

```
hashhedge-blog/
├── CLAUDE.md                       # этот файл
├── HANDOFF.md                      # конспект чата, где проект создавался
├── README.txt                     # человекочитаемый индекс статей
├── styles.css                     # ОБЩИЙ файл стилей (один на все статьи)
├── docs/
│   └── article-generator-spec.json # эталонная спецификация генератора
└── <slug-статьи>/                  # одна папка = одна статья
    ├── ru.html
    ├── en.html
    └── pt.html
```

- `styles.css` лежит в корне и общий для всех статей.
- Каждая статья — отдельная подпапка (slug на латинице, web-friendly).
- HTML-файлы подключают стили по относительному пути `../styles.css`.
- Поддерживаемые языки по спецификации: en / ru / pt / kz (сейчас сделаны ru/en/pt).

## 3. Как добавить новую статью

1. Создай подпапку `<slug>/` рядом с существующими статьями.
2. Внутри — `ru.html`, `en.html`, `pt.html` (и т.д.).
3. В `<head>` каждой подключай `<link rel="stylesheet" href="../styles.css">`.
4. Не дублируй CSS в файлах — все стили только в общем `styles.css`.
5. Добавь статью в `README.txt` (русское название → slug → языки → статус).

## 4. Правила вёрстки статьи (из спецификации)

Порядок блоков строго такой:
1. `article-backlink` — назад в блог. URL по языку: `/blog` (en), `/blog/ru`, `/blog/pt`.
   Текст «Hash Hedge Blog» НЕ переводится.
2. `article-hook` — жёлтый, заглавными, одна цельная фраза без разделителей.
3. `t-title` — заголовок статьи.
4. `article-meta` — `{время чтения}` | `{дата}`, локализуются.
5. Hero-изображение (см. §5).
6. `article-toc` — кликабельное оглавление, пункты ведут на `id` секций
   через `scrollIntoView`. Заголовок локализуется (Содержание / Table of Contents / Índice).
7. Тело статьи: `article-section` с `article-section-title`, тексты `t-descr`.
8. `article-banner` — по центру статьи. Inline-SVG логотип (НЕ background-image),
   локализованный заголовок, жёлтая кнопка.
9. Остальное тело.
10. FAQ: `article-section` с заголовком + `faq-block` (аккордеон).
11. `article-final-promo` — финальный блок с золотой рамкой.

Дополнительно:
- Списки шагов → `article-number-list` / `article-number-item` / `article-number-badge`
  / `article-number-content` / `article-number-title` / `article-number-text`.
- Чек-листы → `article-checklist` / `article-check-item` / `article-check-icon` / `article-check-text`.
- Внутренние ссылки → `<span class="article-link" onclick="window.location.href='URL'">текст</span>`.
- Жирный текст в тексте → `<span class="t-b">…</span>` (только вес, цвет наследуется).

### Разрешённые теги
Только: `div`, `span`, `svg`, `path`, `script`, `style`, плюс `<img>` для
изображений (отступление по просьбе заказчика — см. §5 и §8).
ЗАПРЕЩЕНЫ: `h1`–`h6`, `p`, `ul`, `li`, `a`, `table`, `tr`, `td`, `article`, `main`, `section`.
- Таблицы собираются из `<div>` (классы `article-table` / `article-table-row` /
  `article-table-head` / `article-table-cell` — добавлены в styles.css).

## 5. Изображения

Изображения — это теги `<img>` (отображаются в натуральную величину: ширина
заполняет контейнер, высота автоматическая по пропорциям, без обрезки):

```html
<!-- подсказка на языке статьи -->
<img class="article-hero" src="" alt="ALT-текст">
```

- Ссылка вставляется в атрибут `src=""`. Пустой `src` показывает тёмную заглушку.
- `alt` несёт описательный текст (на языке статьи) для доступности/SEO.
- Классы: `article-hero` (первое изображение) и `article-inline-image` (в теле).
- Количество: 1 hero + inline-картинки в теле (2 inline, если статья ≥1000 слов).
- Логотип в баннере — ИСКЛЮЧЕНИЕ: только inline-SVG, никогда не URL.
- CSS уже задаёт `width:100%; height:auto; display:block` и скругление углов.

## 6. FAQ-аккордеон

- Структура: `article-section` (с `id="section-faq"`) → `article-section-title` →
  `faq-block` → `faq-item` → `faq-toggle` (onclick `toggleFaq(this)`) →
  `faq-question` + `faq-toggle-icon` → `faq-answer`.
- Первый пункт открыт по умолчанию (`faq-item-open`, иконка `−`), остальные `+`.
- Открыт всегда только один пункт. Функция `toggleFaq` — внизу каждого HTML.

## 7. CTA-ссылки (по языкам)

Кнопки «Начать челлендж / Start Challenge / Começar Challenge» — это РЕГИСТРАЦИЯ:
- ru → https://app.hashhedge.com/ru/register/
- en → https://app.hashhedge.com/en/register/
- pt → https://app.hashhedge.com/pt/register/

Логин (если для какой-то кнопки понадобится явно):
- ru → https://app.hashhedge.com/ru/login/
- en → https://app.hashhedge.com/en/login/
- pt → https://app.hashhedge.com/pt/login/

## 8. Принятые отступления от исходной спецификации

Спецификация по умолчанию требует один HTML-блок с inline-`<style>`. По просьбе
заказчика приняты отступления:
1. Стили вынесены в общий внешний `styles.css` (а не inline).
2. Каждый блок обёрнут в полноценный HTML-документ (`<!DOCTYPE html>`, `<head>`
   с подключением шрифта Onest и styles.css) — это готовые страницы.
3. Изображения — теги `<img>` с натуральным размером (ширина 100%, высота авто).
Сам блок `.t-article-wrapper` остаётся paste-ready для Tilda.

## 9. Финальный промо-блок: текущий текст

RU title: «Готовы торговать на капитале проп-фирмы?»
RU descr: «Hash Hedge — #1 крипто проп-трейдинговая платформа. Получите
фондирование до $150К и выводите до 90% прибыли в USDT прямо на свой кошелёк.»
(EN/PT — локализованные эквиваленты, см. готовые файлы.)

## 10. Чек-лист перед сдачей статьи

- [ ] Все `div` сбалансированы (открыт = закрыт).
- [ ] Пункты оглавления ведут на существующие `id` секций.
- [ ] Открыт ровно один FAQ-пункт по умолчанию.
- [ ] Интерфейсные тексты локализованы; «Hash Hedge Blog» — нет.
- [ ] CTA-кнопки ведут на регистрацию с нужным языковым кодом.
- [ ] Изображения = теги `<img>` (src="" под ссылку) с `alt`.
- [ ] Использованы только разрешённые теги.
- [ ] Стили только в `../styles.css`, без дублей в HTML.
