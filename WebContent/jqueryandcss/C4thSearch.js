$(document).ready(
function() {
    zebraRows('tr:odd td', 'odd');
    $('tbody tr').hover(function() {
        $(this).find('td').addClass('hovered');
    }, function() {
        $(this).find('td').removeClass('hovered');
    }); // default each row to visible
    $('tbody tr').addClass('visible'); // overrides CSS
    // display:none property
    // //so only users w/ JS
    // will see the //filter box
    $('#search').show();
    $('#filter').keyup(

    function(event) { // if esc is pressed or// nothing is entered
        if (event.keyCode == 27 || $(this).val() == '') { // if esc is pressed  we want to clear  the value of search  box
            $(this).val(''); // we want each row to be visible because if nothing is entered then all rows are matched.
            $('tbody tr').removeClass('visible').show().addClass('visible'); //first remove all the visible class after that show all elements and again add visible class to all element
        } // if there is text, lets filter
        else {
            filter($('tr.alt td:nth-child(2)').each(function() {}), $(this).val()); //in this .val the text which we have entered in Textbox...if text matches to 
            //the to who show hoga baki sub nikal jae ge ....
            //but in this case .user is class jis main visible and remove ho rah ahai....
        }
        // reapply zebra rows
        $('.visible tr').removeClass('odd');
        zebraRows('.visible:even tr', 'odd');
    });

    // grab all header rows
    $('thead th').each(function(column) {
        $(this).addClass('sortable').click(function() {
            var findSortKey = function($cell) {
                return $cell.find('.sort-key').text().toUpperCase() + ' ' + $cell.text().toUpperCase();
            };
            var sortDirection = $(this).is('.sorted-asc') ? -1 : 1; // step back up the tree and get the rows with data for sorting  
            var $rows = $(this).parent().parent().parent().find('tbody tr').get(); // loop through all the rows and find
            $.each($rows, function(index, row) {
                row.sortKey = findSortKey($(row).children('tbody td:first-child').eq(column));
            }); // compare and sort the rows alphabetically
            $rows.sort(function(a, b) {
                if (a.sortKey < b.sortKey) return -sortDirection;
                if (a.sortKey > b.sortKey) return sortDirection;
                return 0;
            });
            // add the row in th correct order to the table
            $.each($rows, function(index, row) {
                $('tbody').append(row);
                row.sortKey = null;
            }); //identify the column sort order
            $('th').removeClass('sorted-asc sorted-desc');
            var $sortHead = $('th').filter(':nth-child(' + (column + 1) + ')');
            sortDirection == 1 ? $sortHead.addClass('sorted-asc') : $sortHead.addClass('sorted-desc'); //identify the column to be sorted by
            $('td').removeClass('sorted').filter(':nth-child(' + (column + 1) + ')').addClass('sorted');
            $('.visible td').removeClass('odd');
            zebraRows('.visible:even td', 'odd');
        });
    });
});
//used to apply alternating row styles
function zebraRows(selector, className) {
    $(selector).removeClass(className).addClass(className);
}
//filter results based on query
function filter(selector, query) {
    query = $.trim(query); //trim white space
    query = query.replace(/ /gi, '|'); //add OR for regex
    $(selector).each(
    function() {
    	$("td:contains('"+query+"')").css("text-decoration", "underline");
        ($(this).text().search(new RegExp(query, "i")) < 0) ? $(this).closest('tr').hide().removeClass('visible') : $(this).closest('tr').show().addClass('visible');
    });
	}