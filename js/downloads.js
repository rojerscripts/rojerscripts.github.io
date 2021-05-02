
var innerContent = document.getElementsByClassName("ebaniy-obema")[0]

let news = [
    {
        id: 1,
        title: "В процессе",
        desc: "Разработка...",
    }
]

let repos = [
    {
        id: 1,
        title: "Подсчёт онлайна из логов",
        desc: "Помощник в подсчёте онлайна администрации, лидеров и остальных игроков. \n Для нормальной работы скрипта - отключите антивирус.",
        url: "/scripts/online.rar",
    },
    {
        id: 2,
        title: "Moonloader 0.26",
        desc: "Вносит возможность загрузки Lua-скриптов в игру, имеет всю функциональность опкодов игры, библиотеки CLEO, плагина SAMPFUNCS и добавляет свой набор новых функций для разработки.",
        url: "/scripts/moonloader.exe",
    },
    {
        id: 3,
        title: "CLEO 4.0",
        desc: "CLEO расширяет возможности скриптинга и позволяет использовать тысячи уникальных модов , которые изменяют и дополняют процесс игры.",
        url: "/scripts/CLEO.ZIP",
    },
    {
        id: 4,
        title: "SAMPFUNCS v5.4.1",
        desc: "SAMPFUNCS это дополнение к библиотеке CLEO 4, глобально расширяющее возможности скриптеров. ",
        url: "/scripts/sampfunks for arizona.ZIP",
    },
]

if(innerContent) {
    for (var i = 0; i < repos.length; i++) {
        var reposObj = repos[i]
        var reposStr = `<div class="repos-element" id="repos-${reposObj.id}">
    <div class="info">
        <p class="title">${reposObj.title}</p>
        ${reposObj.desc.replace(/\n/g,"<br>")}
    </div>
    <a class="download" href="${reposObj.url}" download>Скачать</a>
</div>`
        innerContent.innerHTML += reposStr
    }
}

if(innerContent) {
    for (var i = 0; i < news.length; i++) {
        var newsObj = news[i]
        var newsStr = `<div class="news-element" id="news-${newsObj.id}">
    <p class="title">${newsObj.title}</p>
    ${newsObj.desc.replace(/\n/g,"<br>")}
</div>`
        innerContent.innerHTML += newsStr
    }
}