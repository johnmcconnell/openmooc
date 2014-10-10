def submit_form(form_name, inputs)
  inputs.each do |key, value|
    fill_in(key, with: value)
  end
  click_button(form_name)
end
