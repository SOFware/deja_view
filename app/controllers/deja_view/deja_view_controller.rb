# frozen_string_literal: true

module DejaView
  class DejaViewController < ApplicationController
    policy_class DejaViewPolicy

    def new
      authorize :new, policy_class: policy_class
    end

    helper_method :deja_view_helper

    def deja_view_helper
      @deja_view_helper ||= DejaView::DejaViewModel.new(
        model_name: params[:record_type],
        model_id: params[:record_id],
        new_record_url: params[:new_record_url]
      )
    end
  end
end
