ActiveAdmin.register ResourceItem do
  form :partial => "form"

  member_action :file_upload, :method => :put do 
    
  end

  controller do
      # This code is evaluated within the controller class

      def upload
	    require 'fileutils'
		tmp = params[:file_upload][:my_file].tempfile
		file = File.join("public", params[:file_upload][:my_file].original_filename)
		FileUtils.cp tmp.path, file
		#FileUtils.rm fileutils
      end
    end
end
