$("#admin-main").prepend("<%= escape_javascript(render 'shared/flash') %>");
$("#edit-order-form").html("<%= escape_javascript(render 'form') %>");
