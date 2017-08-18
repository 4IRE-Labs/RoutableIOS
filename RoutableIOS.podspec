Pod::Spec.new do |s|
 s.name = 'RoutableIOS'
 s.version = '0.0.1'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'It is framework implemented to help manage your IOS app routing'
 s.homepage = 'http://seductive-mobile.com'
 s.social_media_url = 'https://www.facebook.com/malkevych'
 s.authors = { "Malkevych Bohdan Ihorovych" => "webslesar@gmail.com" }
 s.source = { :git => "https://github.com/webslesar/RoutableIOS.git", :tag => "v"+s.version.to_s }
 s.platforms     = { :ios => "9.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/*.swift"
     ss.framework  = "Foundation"
 end

end
