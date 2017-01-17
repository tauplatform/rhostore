class UploadController < ApplicationController
  def new

  end

  def create
    puts "upload params: #{params}"
    name = params[:file].original_filename
    path = Rails.root.join('public', 'images', 'upload', name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }
  end
end