module ApplicationHelper
  def bootstrap_paperclip_picture(form, paperclip_object)
    if form.object.send("#{paperclip_object}?")
      content_tag(:div, class: "control-group") do
        content_tag(:label, "Current #{paperclip_object.to_s.titleize}", class: 'control-label') +
        content_tag(:div, class: "controls") do
          image_tag form.object.send(paperclip_object).send(:url, :medium)
        end
      end
    end
  end
end
