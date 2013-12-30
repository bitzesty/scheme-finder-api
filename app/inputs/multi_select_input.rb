class MultiSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push('js-select2')
  end

  def input_html_options
    super.merge!(multiple: true)
  end
end
