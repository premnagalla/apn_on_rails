namespace :apn do
  
  namespace :notifications do
    
    desc "Deliver all unsent APN notifications."
    task :deliver => [:environment] do
      options = {:cert => configatron.apn.cert,
                 :passphrase => configatron.apn.passphrase,
                 :host => configatron.apn.host,
                 :port => configatron.apn.port}
      APN::Notification.send_notifications(options)
    end
    
  end # notifications
  
  namespace :feedback do
    
    desc "Process all devices that have feedback from APN."
    task :process => [:environment] do
      APN::Feedback.process_devices
    end
    
  end
  
end # apn
