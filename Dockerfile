# Install dependencies
FROM appimagecrafters/appimage-builder
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 psmisc
RUN apt-get install -y --no-install-recommends cmake ninja-build clang build-essential pkg-config libgtk-3-dev liblzma-dev lcov
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter config --enable-windows-desktop
RUN flutter config --enable-macos-desktop
RUN flutter config --enable-linux-desktop
RUN flutter doctor -v

ENV PUB_HOSTED_URL=https://pub.flutter-io.cn