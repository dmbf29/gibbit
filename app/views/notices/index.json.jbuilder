json.array! @notices do |notice|
  # json.user notice.user
  json.gibber notice.gibber.first_name
  json.action notice.action
  # json.notifiable notice.notifiable
  json.url inquiry_path(notice.notifiable)
end
