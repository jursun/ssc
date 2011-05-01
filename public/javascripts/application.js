// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
    $("#tournament_start_dt").datetimepicker({
        ampm: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#tournament_end_dt").datetimepicker({
        ampm: true,
        dateFormat: 'yy-mm-dd'
    });
    $("#tournament_id").change(function() {
        document.cookie = 'tournament='+this.value;
        window.location.reload();
    });
});