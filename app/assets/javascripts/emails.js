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
        submitHandler: function(form) {
            saveMessage();
            $("#dialog-form").dialog( "close" );
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
            "Create an account": function() {
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

    $( "#create-user" ).button().on( "click", function() {
        dialog.dialog( "open" );
    });
}

function saveMessage() {
    $.ajax({
        url: 'create',
        data: $(form).serialize(),
        dataType: "json",
        type: "POST",
        beforeSend: function () {
        },
        success: function (response) {
            $("#test").append(response);
        },
        complete: function (response) {

        },
        error: function (response) {

            alert("Ajax error");

        }
    });

}