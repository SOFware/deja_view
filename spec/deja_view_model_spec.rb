# frozen_string_literal: true

require "rails_helper"

RSpec.describe DejaView::DejaViewModel, type: :model do
  include RSpec::Rails::RequestExampleGroup

  let(:model) {
    described_class.new(
      model_name: "Address",
      model_id: 1
    )
  }

  describe "instance methods" do
    it "#new_record_url returns the expected path" do
      Rails.application.routes.url_helpers.extend(Module.new do
        def new_address_path
          "/addresses/new"
        end
      end)
      expect(model.new_record_url).to eq("/addresses/new")
    end
    it "#edit_record_url returns the expected path" do
      Rails.application.routes.url_helpers.extend(Module.new do
        def edit_address_path(model)
          "/address/#{model}/edit"
        end
      end)
      expect(model.edit_record_url).to eq("/address/1/edit")
    end
    it "#message_text returns the expected value" do
      expect(model.message_text).to include("It looks like you are clicking back after creating a Address.")
    end
    it "#new_button_text returns the expected value" do
      expect(model.new_button_text).to eq("I want to create a new Address record")
    end
    it "#edit_button_text returns the expected value" do
      expect(model.edit_button_text).to eq("I want to edit the Address I just created")
    end
  end
end
