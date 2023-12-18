# frozen_string_literal: true

require "rails_helper"

RSpec.describe DejaView::DejaViewController, type: :request do
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe "GET #new" do
    it "renders the links to create or edit" do
      mission = create(:mission, jtac: user)

      get deja_view_engine.deja_view_path(
        record_type: Mission.name,
        record_id: mission.id,
        new_record_url: new_mission_path(context: "live_fly")
      )

      expect(response.body).to include("<a class=\"deja_view_new_btn_link\" href=\"#{new_mission_path(context: "live_fly")}\">I want to create a new Mission record</a>")
      expect(response.body).to include("<a class=\"deja_view_edit_btn_link\" href=\"#{edit_mission_path(mission)}\">I want to edit the Mission I just created</a>")
    end
  end
end
