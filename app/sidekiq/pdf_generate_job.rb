# frozen_string_literal: true

require 'wicked_pdf'

class PdfGenerateJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    ExportDailyStatToPdf.call
  end
end
