Chef::Log.info("******Installing libpq-dev package.******")

apt_package 'libpq-dev'

apt_package 'imagemagick'

apt_package 'libmagickwand-dev'