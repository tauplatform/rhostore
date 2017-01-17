class UploadController < ApplicationController
  def new

  end

  def create
    puts "upload params: #{params}"
    name = params[:file].original_filename
    directory = "public/images/upload"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    flash[:notice] = "File uploaded"
  end
end