module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields btn btn-secondary',
                       data: { id: id, fields: fields.gsub("\n", "") })
  end

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

  def form_errors_for(object = nil)
    render('shared/form_errors', object: object) if object.errors.any?
  end
end
