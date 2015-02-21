unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  app.development do
    if File.exist? ('/Applications/Reveal.app')
      app.libs += ['/usr/lib/libz.dylib', '/usr/lib/libc++.dylib']
      app.vendor_project '/Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/Reveal.framework', :static, :products => ['Reveal'], :headers_dir => 'Headers'
#      app.vendor_project('/Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/Reveal.framework', :static, :products => ['Reveal'], :cflags => '-ObjC -lz')
      app.frameworks << 'CFNetwork'
      app.frameworks << 'QuartzCore'

    else
      puts "[warning] Reveal.app not found - Download beta from http://www.revealapp.com"
    end
  end
end
