
var innerContent = document.getElementsByClassName("aboba_shlepa")[0]
let news = [
    {
        id: 1,
        title: `Для разработчиков: `,
        desc: '<b>' + "<a href=\"/admin\" style=\"color: rgb(255, 0, 0); text-decoration: none; font-weight: bold;\">Авторизация разработчиков на сайте rojerscripts</a>" + '</b>',
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