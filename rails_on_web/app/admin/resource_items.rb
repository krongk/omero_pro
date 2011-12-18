# encoding: utf-8
ActiveAdmin.register ResourceItem do
  scope :"产品-洗涤设备"
  scope :"产品-干洗用品"
  scope :"产品-水洗用品"
  scope :"产品-辅助设备"
  scope :"产品-家用化工"
  scope :"产品-皮衣保养"
  
  form :partial => "form"

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

  index do
    column :id
    column :resource_type do |item|
      ['图片','文件','视频','音频','Flash'][item.resource_type.to_i - 1] || '未知'
    end
    column :resource_cate do |item|
      item.resource_cate.name
    end
    column :resource_path
    column :resource_name
    column :resource_note do |item|
      #str = ["名称：#{item.resource_name}<br/>"]
      #str << "描述：#{item.resource_note.to_s.truncate(200)}"
      str = []
      if item.resource_type == ResourceItem.type_hash.key('picture').to_s
        str << "<img src = '#{item.resource_path}' width = '60px' />"
      end
      str.join.html_safe
    end
    default_actions
  end
end


#['图片', 1], ['文件', 2], ['视频', 3], ['音频', 4], ['Flash', 5]
#['图片','文件','视频','音频','Flash']