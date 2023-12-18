module DejaView
  class DejaViewModel
    def initialize(model_name:, model_id:, new_record_url: nil, edit_record_url: nil)
      @model_name = model_name
      @model_id = model_id
      @new_record_url = new_record_url
      @edit_record_url = edit_record_url
    end

    attr_accessor :model_name, :model_id

    def new_record_url
      @new_record_url ||=
        Rails.application.routes.url_helpers.send("new_#{model_name.downcase}_path")
    end

    def edit_record_url
      @edit_record_url ||=
        Rails.application.routes.url_helpers.send("edit_#{model_name.downcase}_path", model_id)
    end

    def message_text
      "It looks like you are clicking back after creating a #{model_name}. Did you mean to edit the
      #{model_name}, or did you intend to create a whole new #{model_name} record?"
    end

    def new_button_text
      "I want to create a new #{model_name} record"
    end

    def edit_button_text
      "I want to edit the #{model_name} I just created"
    end
  end
end
