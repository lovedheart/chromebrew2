require 'package'

class Cairo < Package
  description 'Cairo is a 2D graphics library with support for multiple output devices.'
  homepage 'https://www.cairographics.org'
  version '1.15.12'
  source_url 'https://fossies.org/linux/misc/cairo-1.15.12.tar.xz'
  source_sha256 '7623081b94548a47ee6839a7312af34e9322997806948b6eec421a8c6d0594c9'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew2/chromebrew2/cairo-1.15.12-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew2/chromebrew2/cairo-1.15.12-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew2/chromebrew2/cairo-1.15.12-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew2/chromebrew2/cairo-1.15.12-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'ea852eb05e11fe92c33a9a52f94d67fba8fe1747c657c78a1fbf5e9919b5bb25',
     armv7l: 'ea852eb05e11fe92c33a9a52f94d67fba8fe1747c657c78a1fbf5e9919b5bb25',
       i686: '85f9fde1d8b5937e55a7289f1f3c27b30dbb65b6a67d49b3f00c12ccdd7402a6',
     x86_64: '7caeb6ec99fe63985943757484e5c06af572692d573a3fa06bd3a888c1acef85',
  })


  depends_on 'libpng'
  depends_on 'pixman'
  depends_on 'fontconfig' # pango requires cairo with fontconfig
  depends_on 'libtool'
  depends_on 'mesa'
  depends_on 'automake' => :build

  def self.build
    system "./autogen.sh"   # This fixes automake error (when we directly use configure)
    system "./configure \
            --prefix=#{CREW_PREFIX} \
            --libdir=#{CREW_LIB_PREFIX} \
            --enable-xlib \
            --enable-xlib-xcb \
            --enable-glesv2"
    system "make"
  end
  
  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install-strip"
  end
end
