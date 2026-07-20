HASH HEDGE — БЛОГ / СТАТЬИ
================================

Структура папки
---------------
hashhedge-blog/
├── styles.css                     ← общий файл стилей (один на все статьи)
├── README.txt                     ← этот файл (список статей)
└── blog/                          ← все статьи здесь
    ├── stop-loss-prop-traders/
    │   ├── ru.html
    │   ├── en.html
    │   └── pt.html
    ├── best-crypto-prop-firms-2026/
    │   ├── ru.html
    │   ├── en.html
    │   └── pt.html
    ├── prop-firm-payouts-profit-split/
    │   ├── ru.html
    │   ├── en.html
    │   └── pt.html
    ├── false-breakout-vs-liquidity-grab-vs-stop-hunt/
    │   ├── ru.html
    │   ├── en.html
    │   └── pt.html
    ├── liquidity-sweep-trading/
    │   ├── ru.html
    │   ├── en.html
    │   ├── pt.html
    │   ├── hero-ru.png
    │   ├── hero-en.png
    │   └── hero-pt.png
    └── trader-interview-mardon/
        ├── ru.html
        ├── en.html
        ├── pt.html
        └── payout-screenshot.png

Как это работает
----------------
• styles.css лежит в корне и общий для всех статей.
• Все статьи находятся в папке blog/, каждая в своей подпапке.
• HTML-файлы подключают стили по пути ../../styles.css (два уровня выше).
• Чтобы добавить новую статью — создаётся новая подпапка внутри blog/.

Список статей
-------------
1. «Стоп-лосс для проп-трейдеров: как не нарушить лимит дневного убытка»
   папка: blog/stop-loss-prop-traders/
   языки: ru, en, pt
   статус: готово

2. «Лучшие крипто проп-фирмы 2026: как выбрать и не ошибиться»
   папка: blog/best-crypto-prop-firms-2026/
   языки: ru, en, pt
   статус: готово

3. «Как работают выплаты в проп-фирмах: разбираем профит-сплит»
   папка: blog/prop-firm-payouts-profit-split/
   языки: ru, en, pt
   статус: готово

4. «Ложный пробой, захват ликвидности и охота на стопы: в чём разница»
   папка: blog/false-breakout-vs-liquidity-grab-vs-stop-hunt/
   языки: ru, en, pt
   статус: готово

5. «Снятие ликвидности в трейдинге (Liquidity Sweep): что это и как использовать»
   папка: blog/liquidity-sweep-trading/
   языки: ru, en, pt
   статус: готово

6. «Что такое Fair Value Gap (FVG) в крипто-трейдинге и как его использовать»
   папка: blog/fair-value-gap-crypto-trading/
   языки: ru, en, pt
   статус: готово

7. «От участия в пирамидах до Funded-счёта: история Дениса»
   папка: blog/trader-story-funded-account/
   языки: ru, en, pt
   статус: готово

8. «Пересек границу США с помощью картелей: $10 000 – $15 000 в месяц на трейдинге в 22 года»
   папка: blog/trader-interview-mardon/
   языки: ru, en, pt
   статус: готово

9. «Правила проп-челленджа: лимиты просадки и цель по прибыли»
   папка: blog/crypto-prop-firm-evaluation-challenge-rules/
   языки: ru, en, pt
   статус: готово

10. «5 причин провала проп-челленджа и как их избежать»
    папка: blog/why-traders-fail-prop-firm-challenge/
    языки: ru, en, pt
    статус: готово

11. «Как пройти проп-челлендж: от покупки до Funded-аккаунта»
    папка: blog/how-to-pass-crypto-prop-firm-challenge/
    языки: ru, en, pt
    статус: готово

(сюда добавляем новые статьи по мере создания)

Ссылки CTA (регистрация, по языкам)
-----------------------------------
ru → https://app.hashhedge.com/ru/register/
en → https://app.hashhedge.com/en/register/
pt → https://app.hashhedge.com/pt/register/

Логин (если понадобится для каких-то кнопок):
ru → https://app.hashhedge.com/ru/login/
en → https://app.hashhedge.com/en/login/
pt → https://app.hashhedge.com/pt/login/

Важно
-----
Держите styles.css в корне, а статьи в blog/ — если переместить файлы по
отдельности, стили перестанут подхватываться.
