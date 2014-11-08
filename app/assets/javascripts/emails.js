$(document).ready(function() {
    $('#received').dataTable();
    $('#send').dataTable();
    dialogMsg();
});

function dialogMsg() {
    var dialog;
    dialog = $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 500,
        width: 750,
        modal: true,
        buttons: {
            "Create an account": function() {
                dialog.dialog( "close" );
            },
            Cancel: function() {
                dialog.dialog( "close" );
            }
        },
        close: function() {
            dialog.dialog( "close" );
        }
    });

    $( "#create-user" ).button().on( "click", function() {
        dialog.dialog( "open" );
    });
}