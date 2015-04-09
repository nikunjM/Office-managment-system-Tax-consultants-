function Pager(tableName, itemsPerPage) {

this.tableName = tableName;

this.itemsPerPage = itemsPerPage;

this.currentPage = 1;

this.pages = 0;

this.inited = false;

this.showRecords = function(from, to) {

var rows = document.getElementById(tableName).rows;

// i starts from 1 to skip table header row

for (var i = 1; i < rows.length; i++) {

if (i < from || i > to)

rows[i].style.display = 'none';

else

rows[i].style.display = '';

}

}

this.showPage = function(pageNumber) {

if (! this.inited) {

alert("not inited");

return;

}

var oldPageAnchor = document.getElementById('pg'+this.currentPage);

oldPageAnchor.className = 'pg-normal';

this.currentPage = pageNumber;

var newPageAnchor = document.getElementById('pg'+this.currentPage);

newPageAnchor.className = 'pg-selected';

var from = (pageNumber - 1) * itemsPerPage + 1;

var to = from + itemsPerPage - 1;

this.showRecords(from, to);

}

this.prev = function() {

if (this.currentPage > 1)

this.showPage(this.currentPage - 1);

}

this.next = function() {

if (this.currentPage < this.pages) {

this.showPage(this.currentPage + 1);

}

}

this.init = function() {

var rows = document.getElementById(tableName).rows;

var records = (rows.length - 1);

this.pages = Math.ceil(records / itemsPerPage);

this.inited = true;

}

this.showPageNav = function(pagerName, positionId) {

if (! this.inited) {

alert("not inited");

return;

}

var element = document.getElementById(positionId);

var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span> ';

for (var page = 1; page <= this.pages; page++)

pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';

pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next »</span>';

element.innerHTML = pagerHtml;
}
}





function updateClock() {
    var now = new Date();
    var elem = document.getElementById('clock');
    elem.innerHTML = dateFormat(now, "dddd, mmmm dS, yyyy, h:MM:ss TT");
}
$(function () {
    $('table.sortable').each(function() {
        var $table = $(this);
        $('th', $table).each(function(column) {
             var $header = $(this);
             if ($header.hasClass('sort-alpha')) {
                $header.addClass('clickable').hover(
                        function() { $header.addClass('active') }, 
                        function() { $header.removeClass('active');
                        })
                    .click(function() {
                        $header.hasClass('asc')? 
                          $header.removeClass('asc').addClass('desc'): 
                          $header.removeClass('desc').addClass('asc');
                        var rows = $table.find('tbody > tr').get();

                        rows.sort(function(a, b) {
                            var keyA = $(a).children('td').eq(column).text().toUpperCase();
                            var keyB = $(b).children('td').eq(column).text().toUpperCase();

                            if (keyA > keyB) {
                                return ($header.hasClass('asc')) ? 1 : -1;
                              }
                            if (keyA < keyB) {
                              return ($header.hasClass('asc')) ? -1 : 1;
                            }
                            return 0;                       
                        });

                        $.each(rows, function(index, row) {
                            $table.find('tbody').append(row);
                        });
                    });
             }
        });
    });
});


function RightHandMenu()
{
    if(window.XMLHttpRequest){
        reqObj=new XMLHttpRequest();
    }else {
        reqObj=new ActiveXObject("Microsoft.XMLHTTP");
    }
    reqObj.onreadystatechange=ProcessAjaxquerySubmiter;
    reqObj.open("POST","/IssueTracker/AjaxReuestPages/RightHandMenu.jsp",true);
    reqObj.send(null);
}
function ProcessAjaxquerySubmiter(){
    if(reqObj.readyState==4){
        document.getElementById("RightMenu").innerHTML=reqObj.responseText;
    }
}
