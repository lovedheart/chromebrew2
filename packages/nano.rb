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
    aarch64: '4f1dd5c2e5d50d706958003d4f6b522b79379ff884ad31a17a46bbc2a06a9f25',
     armv7l: '4f1dd5c2e5d50d706958003d4f6b522b79379ff884ad31a17a46bbc2a06a9f25',
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
    Dir.chdir("#{CREW_DEST_DIR}/home/chronos/user") do
      target = open('.nanorc', 'w') { |f|
        f << "set autoindent\n"
        f << "set constantshow\n"
        f << "set fill 72\n"
        f << "set historylog\n"
        f << "set multibuffer\n"
        f << "set nohelp\n"
        f << "set nowrap\n"
        f << "set positionlog\n"
        f << "set historylog\n"
        f << "set quickblank\n"
        f << "set regexp\n"
        f << "set smooth\n"
        f << "set suspend\n"
      }
      target.close
    end
  end
  
  def self.postinstall
    puts "Personal configuration file is located in /home/chronos/user/.nanorc".lightgreen
  end
end
