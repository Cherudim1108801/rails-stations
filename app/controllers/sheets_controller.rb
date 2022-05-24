class SheetsController < ApplicationController
  def sheet
    @sheets = Sheet.all
  end
end
