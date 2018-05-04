require 'package'

class Filecmd < Package
  description 'file command determines the file type.'
  homepage 'ftp://ftp.astron.com/pub/file'
  version '5.33'
  source_url 'ftp://ftp.astron.com/pub/file/file-5.33.tar.gz'
  source_sha256 '1c52c8c3d271cd898d5511c36a68059cda94036111ab293f01f83c3525b737c6'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew2/chromebrew2/filecmd-5.33-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew2/chromebrew2/filecmd-5.33-chromeos-armv7l.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'c1248a0912c04708029a3fcff29133413dbc263083e0c05ba3e0dd524072e770',
     armv7l: 'c1248a0912c04708029a3fcff29133413dbc263083e0c05ba3e0dd524072e770',
  })

  def self.build
    system "./configure",
           "--prefix=#{CREW_PREFIX}",
           "--libdir=#{CREW_LIB_PREFIX}",
           "--disable-libseccomp"
    system "make"
  end
  def self.check
    system "make", "check"
  end
  
  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install-strip"
  end
end
