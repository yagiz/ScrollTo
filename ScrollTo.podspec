Pod::Spec.new do |s|
  s.name             = 'ScrollTo'
  s.version          = '0.1.1'
  s.summary          = 'ScrollTo is a little extension to scroll through the scroll view until the given view is at a particular location on the screen.'
 
  s.description      = <<-DESC
ScrollTo is a little UIScrollView and UIView extension that enables to scroll through the scroll view until the given view is at a particular location on the screen. It doesn't matter if given view is in a complicated hiearchy. ScrollTo calculates the position of the view according to scroll view coordinate. It basically mimicks the behaviour of the scrollToRow(at:at:animated:) method of UITableView.
                       DESC
 
  s.homepage         = 'https://github.com/yagiz/ScrollTo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yagiz' => 'yagizgurgul@gmail.com' }
  s.source           = { :git => 'https://github.com/yagiz/ScrollTo.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'ScrollTo/ScrollTo.swift'
 
end