class Recording < ActiveRecord::Base

  belongs_to :question

  has_attached_file :audio,
    storage: :ftp,
    path: "public_http/#{ Rails.env }/:attachment/:id/audio.mp3",
    url: "http://net2ftp.ru/node0/endenis@mail.ru/#{ Rails.env }/:attachment/:id/audio.mp3",
    ftp_servers: [
      {
        host: ENV['FTP_SERVER'],
        user: ENV['FTP_USER'],
        password: ENV['FTP_PASSWORD'],
        passive: true
      }
    ]

  validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\Z/

end
