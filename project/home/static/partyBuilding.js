(function(){
    var baseUrl = 'http://yanjin.ptbird.cn/banner.html'
    
    
    $.get(baseUrl).then((data) => {

        var pic = $('#pic')
        var content = $('#content')

        data.forEach((v, i) => {
            var img = $('<img>').attr('src', v.img)
            var a = $('<a>').attr('href',v.url).append(img)
            var li = $('<li>').append(a)
            pic.append(li)

            var a = $('<a>').attr('href',v.url).text(v.title)
            var cli = $('<li>').append(a)
            content.append(cli)
        })

        $(function() {
            var slider = $('.banner').unslider({
                animation: 'fade', autoplay: true, arrows: false
            });
            $('#content li').eq(0).css('color','#ff7368')
            slider.on('unslider.change', function(event, index, slide) {
                $('#content li').eq(index-1).css('color','#000')
	            $('#content li').eq(index).css('color','#ff7368')
            });
        });


    })
})()
