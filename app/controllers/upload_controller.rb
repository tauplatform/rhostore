require 'fileutils'

class UploadController < ApplicationController
  def new

  end

  def create
    puts "uploading: upload params = #{params}"
    filename = params[:file].original_filename
    dirname = File::join(Rails.public_path, 'images', 'upload')

    unless File.directory?(dirname)
      puts "uploading: create uploading directory #{dirname}"
      FileUtils.mkdir_p(dirname)
    end

    path = File::join(Rails.public_path, 'images', 'upload', filename)
    File.open(path, 'wb') { |f| f.write(params[:file].read) }
    redirect_to '/upload/new'
  end
end