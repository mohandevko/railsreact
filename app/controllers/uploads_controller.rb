class UploadsController < ApplicationController
  helper_method :sort_column, :sort_direction
  require 'csv'
  def index
  	@data = Mapping.paginate(page: params[:page])
    @data = @data.order(sort_column + " " + sort_direction)
  end

  def import
  end

  def upload_data
  	tmp = params[:file_upload][:my_file].tempfile
    require "fileutils"
    file = File.join("public", params[:file_upload][:my_file].original_filename)
    FileUtils.cp tmp.path, file
    	
  	csv_text = File.read(tmp)
  	csv = CSV.parse(csv_text, :headers => true)
  	convert = {"Pri" => "pri", "Question" => "question", "Teaming Stages" => "teaming_tages", "Appears (Day)" => "appears", "Frequency" => "frequency", "Type" => "type_of_data", "Role" => "role", "Required?" => "required", "Conditions" => "conditions", "Mapping" => "mapping"}
  	CSV.foreach(tmp, headers: true, header_converters: lambda { |name| convert[name] }) do |row|
  	  new_hash = {}
  	  row.to_hash.each_pair do |k,v|
  	   new_hash.merge!({k.downcase => v}) 
  	  end
  	  Mapping.create!(new_hash)
  	end
  	flash[:notice] = "File uploaded successfully"
    redirect_to uploads_path
  end

  def delete_data
    Mapping.delete_all
    redirect_to uploads_path
  end

  private

  def sort_column
    Mapping.column_names.include?(params[:sort]) ? params[:sort] : "Question"
    Mapping.column_names.include?(params[:sort]) ? params[:sort] : "Role"
    Mapping.column_names.include?(params[:sort]) ? params[:sort] : "Mappings"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
