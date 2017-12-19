$(function () {
    var root = $('#root');
    var margin = {
    };
    $('button[name="btn-print"]').click(function () {
        $(root).print({
            //Use Global styles
            globalStyles: false,
            //Add link with attrbute media=print
            mediaPrint: false,
            //Custom stylesheet
            // stylesheet : "http://fonts.googleapis.com/css?family=Inconsolata",
            //Print in a hidden iframe
            iframe: true,
            //Don't print this
            noPrintSelector: ".avoid-this",
            //Add this at top
            prepend: "Hello World!!!"
        });
    });
    $('button[name="btn-page"]').click(function () {
        paging();
    });

    function ignore(item) {
        var b = false;
        var position = item.css('position');
        if (item.css('display') == 'none') {
            b = true;
        } else if (position == 'absolute' || position == 'fixed') {
            b = true;
        } else {
            b = false;
        }
        return b;
    }

    function paging() {
        // root.append('<div id="ruler" style="width: 25.7cm;position: absolute"></div>');
        root.append('<div id="v-ruler" class="v-ruler"></div>');
        // root.append('<div id="ruler-inner" class="ruler-inner"></div>');
        console.log($('#ruler').width());
        var mockPage = $('.page-box', root);
        var children = mockPage.children();
        for (var i = 0; i < children.length; i++) {
            var item = children.eq(i);
            if (!ignore(item)) {
                console.log(item.outerHeight());
            }
        }
    }
});