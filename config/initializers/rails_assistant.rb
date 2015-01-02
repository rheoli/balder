# 
#  rails_assistant.rb
#  RailsAssistant.App 
#
#  Copyright (c) 2013 Nocturnal Code Limited. All rights reserved.
#
#  This file is automatically generated
#  Any manual edits to this file could be overwritten
#  Settings can be altered from Rails Assistant itself


# only run this code when your app is run from Rails Assistant
if ENV['com.nocturnalcode.RailsAssistant']
    
	# disable buffered output, we want this realtime!
	STDOUT.sync = true
	STDERR.sync = true
    
    # better log formatting, we can parse this nice and easy
	class Logger::SimpleFormatter
        def call(severity, time, progname, msg)
            "\x1D[#{time.strftime("%F %T.%L %z")}] #{severity} #{msg}\x1E\n"
        end
    end

end