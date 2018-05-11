require 'package'

class Libsdl < Package
  description 'Simple DirectMedia Layer is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware via OpenGL and Direct3D.'
  homepage 'http://www.libsdl.org'
  version '1.2.15-3'
  source_url 'http://www.libsdl.org/release/SDL-1.2.15.tar.gz'
  source_sha256 'd6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew2/chromebrew2/libsdl-1.2.15-3-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew2/chromebrew2/libsdl-1.2.15-3-chromeos-armv7l.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'cc95bf8248e257d30520555bfce4885fc564c00489b5185c09b6033059b665be',
     armv7l: 'cc95bf8248e257d30520555bfce4885fc564c00489b5185c09b6033059b665be',
  })

  depends_on 'dbus'
  depends_on 'eudev'
  depends_on 'alsa_lib'

  def self.build
    system './configure',
           "--prefix=#{CREW_PREFIX}",
           "--libdir=#{CREW_LIB_PREFIX}",
           '--enable-video-wayland',
           '--disable-video-x11'
    system 'make'
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
