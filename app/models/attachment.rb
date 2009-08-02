class Attachment < ActiveRecord::Base
  belongs_to :users
  has_attachment :storage => :file_system, :path_prefix => 'public/files',
                :max_size => 10.megabytes,
                :resize_to => '650x480>',
                :thumbnails => { :thumb => '100x100>' },
                :processor => "mini_magick",   #mini_magick도 좋음
                :content_type => :image
end
