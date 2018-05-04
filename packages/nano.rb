require 'package'

class Nano < Package
  description 'Nano\'s ANOther editor, an enhanced free Pico clone.'
  homepage 'https://www.nano-editor.org/'
  version '2.9.5'
  source_url 'https://www.nano-editor.org/dist/v2.9/nano-2.9.5.tar.xz'
  source_sha256 '7b8d181cb57f42fa86a380bb9ad46abab859b60383607f731b65a9077f4b4e19'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew2/chromebrew2/nano-2.9.5-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew2/chromebrew2/nano-2.9.5-chromeos-armv7l.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'db65eccb8a1045fa3fb26efc52e3d6a3762a8f58910df31e16bdd6f2473504a9',
     armv7l: 'db65eccb8a1045fa3fb26efc52e3d6a3762a8f58910df31e16bdd6f2473504a9',
  })

  depends_on 'ncurses'
  depends_on 'filecmd'

  def self.build
    system "./configure",
           "--prefix=#{CREW_PREFIX}",
           "--enable-utf8"
    system 'make'
  end

  def self.install
    system 'make', "DESTDIR=#{CREW_DEST_DIR}", 'install-strip'
    
    system "mkdir -pv #{CREW_DEST_DIR}/home/chronos/user"
    system "touch #{CREW_DEST_DIR}/home/chronos/user/.nanorc"
    puts "Create personal configuration file in /home/chronos/user/.nanorc".lightblue

  end
  
  def self.postinstall
    puts "Personal configuration file is located in /home/chronos/user/.nanorc".lightgreen
  end
end
