class Api::V1::FileManagerController < ApplicationController
  # before_action :validate_upload, only: [:upload]
  FILE_PATH = Rails.root.join('public', 'uploads')

  def list
    @images = Dir.glob('public/uploads/*')
    if @images.present?
      render template: 'api/v1/file_manager/list.json', status: 200
    else
      head :no_content
    end
  end

  def upload
    binding.pry
    begin
      File.open(FILE_PATH.join(@file.original_filename), 'wb') do |file|
        file.write(@file.read)
      end
      render json: {success: 'File upload success', status:200}
    rescue
      render json: {error: 'Something went wrong, please try again after sometime', status:500}
    end
  end

  private

  def validate_upload
    @file = params['file']
    validate = ValidateUploadService.new(@file).validate
    render json: validate and return unless validate[:success]
  end
end
