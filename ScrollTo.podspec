Pod::Spec.new do |s|
  s.name             = 'ScrollTo'
  s.version          = '0.1.0'
  s.summary          = 'A simple extension to scroll a view in a ScrollVie(TableView,CollectionView)'
 
  s.description      = <<-DESC
A simple extension to scroll a view in a ScrollVie(TableView,CollectionView).
                       DESC
 
  s.homepage         = 'https://github.com/yagiz/ScrollTo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yagiz' => 'yagizgurgul@gmail.com' }
  s.source           = { :git => 'https://github.com/yagiz/BubbleButton.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'ScrollTo/ScrollTo.swift'
 
end