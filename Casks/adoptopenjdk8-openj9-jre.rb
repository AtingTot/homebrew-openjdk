# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk8-openj9-jre' do
  version '8,242:b08'
  sha256 '040da24d0fd235743eccc21ea32d8ac4036dff43e8f38c48f9d131467d490cce'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u242-b08_openj9-0.18.1/OpenJDK8U-jre_x64_mac_openj9_8u242b08_openj9-0.18.1.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8 (OpenJ9) (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_8u242b08_openj9-0.18.1.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.8-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.8-openj9.jre'
end
