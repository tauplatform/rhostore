require 'fileutils'

class UploadController < ApplicationController
  def new
    respond_to do |format|
      puts "new params #{params}"
      msg = {:status => "ok", :filename => @params[:filename]}
      format.json { render :json => msg } # don't do msg.to_json
    end
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
    redirect_to '/upload/new', :filename => "https://taustore.herokuapp.com/images/upload/#{filename}"
  end
end