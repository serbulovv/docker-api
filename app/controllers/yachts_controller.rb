class YachtsController < ApplicationController
  def index
    data = YachtDataParserService.new.call
    render json: data
  end
end