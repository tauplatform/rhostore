require 'fileutils'

class UploadController < ApplicationController
  def new

  end

  def create
    puts "uploading: upload params = #{params}"
    filename = params[:file].original_filename
    dirname = Rails.root.join('public', 'images', 'upload')
    path = Rails.root.join(dirname, filename)

    unless File.directory?(dirname)
      puts "uploading: create uploading directory #{dirname}"
      FileUtils.mkdir_p(dirname)
    end
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    puts "uploading: file saved to #{path}"
  end
end