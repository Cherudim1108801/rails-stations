class SheetsController < ApplicationController
  def sheets
    @sheets = Sheet.all
  end
end
