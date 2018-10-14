class ValidateUploadService
  FILE_FORMATS =  ["image/jpeg", "image/jpg", "image/png", "image/bmp"]
  MIN_DIMENSION = 350
  MAX_DIMENSION = 5000

  def initialize(file)
    @file = file
  end

  def validate
    return {error: 'No File found', status: 422} unless @file.present?
    return {error: 'File format mismatch - File formats are limited to bitmaps: JPG and PNG', status: 422} unless FILE_FORMATS.include? @file.content_type.chomp
    dimensions = eval(%x(identify -format '[%w,%h]' #{@file.tempfile.path}))
    return {error: 'File dimension mismatch - Files are limited to a minimum of 350x350 and a maximum of 5000x5000 size', status: 422} unless (dimensions.min >= MIN_DIMENSION && dimensions.max <= MAX_DIMENSION)
    return {success: true}
  end

end
