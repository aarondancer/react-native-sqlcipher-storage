require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name     = "react-native-sqlcipher-storage"
  s.version  = package['version']
  s.summary  = package['description']
  s.homepage = "https://github.com/andpor/react-native-sqlite-storage"
  s.license  = package['license']
  s.authors   = { 'Tony Million' => 'tonymillion@gmail.com' }
  s.source   = { :git => "https://github.com/aarondancer/react-native-sqlcipher-storage.git", :branch => "master" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.preserve_paths = 'README.md', 'LICENSE', 'package.json', 'sqlite.js'
  s.source_files   = "src/ios/*.{h,m}"

  s.frameworks    = ['Security']
  s.dependency 'React'
  s.dependency 'SQLCipher'

  s.xcconfig      = {
    'OTHER_CFLAGS' => '$(inherited) -DSQLITE_HAS_CODEC -DSQLCIPHER_CRYPTO_CC'
  }
end
