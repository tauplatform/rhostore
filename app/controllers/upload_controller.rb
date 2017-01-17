require 'fileutils'

class UploadController < ApplicationController
  def new

  end

  def create
    puts "uploading: upload params = #{params}"
    filename = params[:file].original_filename
    dirname = Rails.public_path.join('public', 'images', 'upload')
    #dirname = Rails.public_path
    path = File.join(dirname, filename)

    unless File.directory?(dirname)
      puts "uploading: create uploading directory #{dirname}"
      FileUtils.mkdir_p(dirname)
    end
    File.open(path, 'wb') { |f| f.write(params[:file].read) }
    redirect_to '/upload/new'
  end
end