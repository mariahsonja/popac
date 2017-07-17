// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require vendor/jquery.min
//= require vendor/bootstrap.min
//= require vendor/waypoints.min
//= require vendor/jquery.scrollTo.min
//= require vendor/jquery.localScroll.min
//= require vendor/jquery.magnific-popup.min
//= require vendor/validate
//= require vendor/common
//= require vendor/typeahead.bundle
//= require vendor/bootstrap-tagsinput
//= require_self

$(function() {
    $('[data-tags]').each(function(idx, element) {
        var $input   = $(element);
        var source   = $input.data('source');
        var selected = $input.data('selected') || [];
        var dataset  = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: source
        });

        dataset.initialize();

        $input.tagsinput({
            itemValue: 'value',
            itemText: 'text',
            typeaheadjs: {
                name: $input.data('tags'),
                displayKey: 'text',
                source: dataset.ttAdapter()
            }
        });
        
        $.each(source, function(idx, record) {
            if ( ~$.inArray(record.value, selected) ) {
                $input.tagsinput('add', record);
            }
        })
    });
});
