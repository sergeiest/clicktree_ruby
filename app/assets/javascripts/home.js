$(document).ready(function(){
	$('.how-it-works-mini').click(function(){
		var index = this.getAttribute('data-index');
		console.log("how-it-works-" + index);
		var elems = document.getElementsByClassName("how-it-works-" + index);
		elems[0].scrollIntoView(20);

	});
});

Scroll_To = function(elem, pos)
{
    var y = elem.scrollTop;
    y += (pos - y) * 0.3;
    if (Math.abs(y-pos) < 2)
    {
        elem.scrollTop = pos;
        return;
    }
    elem.scrollTop = y;
    setTimeout(Scroll_To, 40, elem, pos);   
}

