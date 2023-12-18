module DejaView
  module ControllerMethods
    extend ActiveSupport::Concern

    class_methods do
      def deja_view_for(deja_view_callback, interstitial: true)
        @@deja_view_callback = deja_view_callback
        @@deja_view_interstitial = interstitial
      end
    end

    included do
      helper_method :deja_view_decision_panel
      helper_method :deja_view_helper
      before_action :redirect_to_decision_if_clicked_back, only: [:new]
    end

    def deja_view_decision_panel
      if routing_back? && model
        render partial: "deja_view/decision_panel"
      end
    end

    def deja_view_helper
      @deja_view_helper ||= DejaView::DejaViewModel.new(
        model_name: model.class.name,
        model_id: model.id,
        new_record_url: request.original_url
      )
    end

    def routing_back?
      request.referrer == request.original_url
    end

    def model
      @model ||= send(@@deja_view_callback)
    end

    def redirect_to_decision_if_clicked_back
      if @@deja_view_interstitial && routing_back? && model
        redirect_to deja_view_engine.deja_view_path(
          new_record_url: request.original_url,
          record_id: model.id,
          record_type: model.class.name
        )
      end
    end
  end
end
