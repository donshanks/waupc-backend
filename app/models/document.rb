class Document < ActiveRecord::Base
  upload_column :filename, 
    :store_dir => 'files',
    :filename  => proc { |record,file| pp record; "#{record.caption.gsub(/\s/,'_').camelize}.#{file.extension}" }

  MIMETYPES = {
    'Adobe Acrobat'   => 'application/x-pdf',
    'Anytime Deluxe'  => 'application/octet-stream',
    'Microsoft Excel' => 'application/vnd.ms-excel',
    'Microsoft Word'  => 'application/vnd.ms-word',
    'Other'           => 'application/octet-stream',
    'Text'            => 'text/plain'
  }

end
