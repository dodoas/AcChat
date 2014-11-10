$(document).ready(function() {
    dialogMsg();
    validateEmail();
});
function validateEmail() {
    $("#new_email").validate({
        rules: {
            "email[message_subject]": {required: true},
            "email[message_body]": {required: true}
        },
        messages: {
            "email[message_subject]": {required: "Please Enter Message Subject!"},
            "email[message_body]": {required: "Please Enter Message Body"}
        },
        submitHandler: function() {
            saveMessage();
        }
    });
}
function dialogMsg() {
    var dialog;
    dialog = $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 500,
        width: 750,
        modal: true,
        buttons: {
            "Create new message": function() {
                $("#new_msg_click").trigger( "click" );
            },
            Cancel: function() {
                dialog.dialog( "close" );
            }
        },
        close: function() {
            dialog.dialog( "close" );
        }
    });

    $( "#open_new_msg_dialog" ).click(function() {
        dialog.dialog( "open" );
    });
}
function saveMessage() {
    $.ajax({
        url: 'emails',
        data: $("#new_email").serialize(),
        dataType: "json",
        type: "POST",
        beforeSend: function(response) {
        },
        success: function(response) {

        },
        complete: function(response) {
            $("#dialog-form").dialog( "close" );
        },
        error: function(response) {
            alert("Ajax error");
        }
    });
}