require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  # Use your fork as the source.
  s.source = { :git => "https://github.com/nica0012/ffmpeg-kit.git", :tag => "react.native.v#{s.version}" }

  # Set the default subspec to use your self-built full-gpl configuration.
  s.default_subspec   = 'full-gpl'

  s.dependency "React-Core"

  # The following subspecs remain unchanged—they reference prebuilt binaries.
  s.subspec 'min' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'min-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'min-gpl' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min-gpl', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'min-gpl-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min-gpl', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'https' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'https-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'https-gpl' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https-gpl', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'https-gpl-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https-gpl', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'audio' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-audio', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'audio-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-audio', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'video' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-video', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'video-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-video', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'full' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-full', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'full-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-full', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  # The updated subspec for full-gpl uses vendored frameworks from your self-built XCFrameworks.
  s.subspec 'full-gpl' do |ss|
    ss.ios.vendored_frameworks = 'Frameworks/ffmpegkit.xcframework',
                                 'Frameworks/libavcodec.xcframework',
                                 'Frameworks/libavdevice.xcframework',
                                 'Frameworks/libavfilter.xcframework',
                                 'Frameworks/libavformat.xcframework',
                                 'Frameworks/libavutil.xcframework',
                                 'Frameworks/libswresample.xcframework',
                                 'Frameworks/libswscale.xcframework'
    ss.public_header_files = 'Frameworks/ffmpegkit.xcframework/**/*.h'
    ss.source_files = 'FFmpegKitReactNativeModule.{h,m}', 'Frameworks/ffmpegkit.xcframework/**/*.h'
    ss.header_dir = 'ffmpegkit'
    ss.ios.deployment_target  = '12.1'
    ss.libraries = ['z', 'bz2', 'c++', 'iconv']  # Link any system libs FFmpegKit needs
  end
  

  # Optionally, you can leave the full-gpl-lts subspec if needed. It currently still depends on a prebuilt binary.
  # You might consider removing or updating this subspec if you want to use your self-built frameworks for LTS versions as well.
  s.subspec 'full-gpl-lts' do |ss|
      ss.source_files = '**/FFmpegKitReactNativeModule.m',
                        '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-full-gpl', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

end
