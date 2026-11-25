# frozen_string_literal: true

module FlashMessage
  class Component < ApplicationComponent
    attr_reader :type, :message

    def initialize(type:, message:)
      @type = type
      @message = message
    end

    def title
      message.is_a?(Hash) ? (message["title"] || message[:title]) : message
    end

    private

      def color_classes
        case type
        when 'success'
          'alert-success'
        when 'error'
          'alert-danger'
        when 'warning'
          'alert-warning'
        when 'notice'
          'alert-info'
        else
          'alert-secondary'
        end
      end
  end
end