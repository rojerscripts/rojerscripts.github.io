
var innerContent = document.getElementsByClassName("ebaniy-neobema")[0]
let news = [
    {
        id: 1,
        title: `27.04.2021 | Релиз скрипта "Подсчёт онлайна из логов" `,
        desc: "Подробнее о скрипте / скачать - <a href=\"https://rojerscripts.github.io/downloads\" style=\"color: rgb(255, 0, 0); text-decoration: none; font-weight: bold;\">перейти</a>",
    },
]

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