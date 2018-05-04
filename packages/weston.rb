require 'package'

class Weston < Package
  description 'Weston is the reference implementation of a Wayland compositor, and a useful compositor in its own right.'
  homepage 'http://wayland.freedesktop.org'
  version '4.0.0'
  source_url 'https://github.com/wayland-project/weston/archive/4.0.0.tar.gz'
  source_sha256 '46b0178cd37b0bf7471c9af12c847c7b8728699ecd5c04ce79be77ea12c98512'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew2/chromebrew2/weston-4.0.0-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew2/chromebrew2/weston-4.0.0-chromeos-armv7l.tar.xz',
  })
  binary_sha256 ({
    aarch64: '5252debd2d7c5b896f733ae5bffa971d77f5ebcbf176ec2c11e3eb8bd3ab0456',
     armv7l: '5252debd2d7c5b896f733ae5bffa971d77f5ebcbf176ec2c11e3eb8bd3ab0456',
  })
  
  depends_on 'harfbuzz'
  depends_on 'libxcursor'
  depends_on 'libinput'
  depends_on 'libxkbcommon'
  depends_on 'libwayland'
  depends_on 'wayland_protocols'
  depends_on 'libjpeg_turbo'
  depends_on 'libunwind'
    
  depends_on 'pango'
  depends_on 'dbus'
  
  depends_on 'libxxf86vm'

  def self.build
    system "./autogen.sh"
    system "./configure",
           "--prefix=#{CREW_PREFIX}",
           "--libdir=#{CREW_LIB_PREFIX}",
           "--disable-weston-launch",
           "--enable-demo-clients-install"
    system "make"
  end

  def self.install
    system "make DESTDIR=#{CREW_DEST_DIR} install"
  end
end

