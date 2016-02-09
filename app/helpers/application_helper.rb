module ApplicationHelper
  BOOTSTRAP_FLASH_MSG = {
      success: "success",
      error: "danger",
      alert: "warning",
      notice: "info"
    }

    def bootstrap_class_for(flash_type)
      BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type)
    end

    def flash_messages
      flash.each do |msg_type, message|
        concat(content_tag(:div, message, class: "alert alert-#{bootstrap_class_for(msg_type)} fade in") do
                concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                concat message
              end)
      end
      nil
    end
end
