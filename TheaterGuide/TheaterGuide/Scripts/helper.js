$(function () {
    $('input[type="date"]').prop('type', 'text'); // prevent chrome calender
    $("#Date").datepicker().attr('readonly', 'readonly');
    $("#ReleaseDate").datepicker().attr('readonly', 'readonly');

    $("#Date").keydown(function (e) {
        if (e.which == 46 || e.which == 8) {
            //Delete and backspace clear text 
            $(this).val(''); //Clear text
            $(this).datepicker("hide"); //Hide the datepicker calendar if displayed
            $(this).blur(); //aka "unfocus"
        }

        //Prevent user from manually entering in a date - have to use the datepicker box
        e.preventDefault();
    });

    $.fn.stars = function () {
        return $(this).each(function () {
            // Get the value
            var val = parseFloat($(this).html());
            // Make sure that the value is in 0 - 5 range, multiply to get width
            var size = Math.max(0, (Math.min(5, val))) * 16;
            // Create stars holder
            var $span = $('<span />').width(size);
            // Replace the numerical value with stars
            $(this).html($span);
        });
    };

    $('span.stars').stars();   
});