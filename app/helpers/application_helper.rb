module ApplicationHelper
  BOOTSTRAP_FLASH_MSG = { success: 'alert-success',
                          error: 'alert-danger',
                          alert: 'alert-warning',
                          notice: 'alert-info'
                        }.with_indifferent_access.freeze

  def class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message,
                         class: "alert #{class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x'.html_safe,
                           class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end
end
