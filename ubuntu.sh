#!/data/data/com.termux/files/usr/bin/bash
# Folder where Ubuntu filesystem will be extracted
ubuntu_dir=ubuntu-fs

# Check if the folder already exists
if [ -d "$ubuntu_dir" ]; then
    skip_download=true
    echo "Ubuntu filesystem already exists, skipping download."
fi

# Tarball file name
tarball="ubuntu.tar.gz"

# If download is not skipped, proceed to download and extract
if [ "$skip_download" != true ]; then
    # Check if the tarball already exists
    if [ ! -f $tarball ]; then
        echo "Starting download of Ubuntu image..."
        case `dpkg --print-architecture` in
            aarch64)
                arch="arm64" ;;
            arm)
                arch="armhf" ;;
            amd64)
                arch="amd64" ;;
            i*86)
                arch="i386" ;;
            x86_64)
                arch="amd64" ;;
            *)
                echo "Architecture not recognized, exiting."; exit 1 ;;
        esac
        wget "https://partner-images.canonical.com/core/disco/current/ubuntu-disco-core-cloudimg-${arch}-root.tar.gz" -O $tarball
    fi

    current_dir=`pwd`
    mkdir -p "$ubuntu_dir"
    cd "$ubuntu_dir"

    echo "Extracting Ubuntu image..."
    proot --link2symlink tar -xf ${current_dir}/${tarball} --exclude='dev' ||:

    echo "Configuring nameserver for internet connectivity..."
    echo "nameserver 1.1.1.1" > etc/resolv.conf

    cd "$current_dir"
fi

# Directory for bind mounts
mkdir -p binds

# Script to start Ubuntu
launch_script=start-my-ubuntu.sh

echo "Creating launch script..."
cat > $launch_script <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## Unset LD_PRELOAD to avoid issues with termux-exec
unset LD_PRELOAD
cmd="proot"
cmd+=" --link2symlink"
cmd+=" -0"
cmd+=" -r $ubuntu_dir"
if [ -n "\$(ls -A binds)" ]; then
    for file in binds/* ;do
      . \$file
    done
fi
cmd+=" -b /dev"
cmd+=" -b /proc"
## Uncomment to access Termux home directory inside Ubuntu
#cmd+=" -b /data/data/com.termux/files/home:/root"
## Uncomment to mount SD card directly to root
#cmd+=" -b /sdcard"
cmd+=" -w /root"
cmd+=" /usr/bin/env -i"
cmd+=" HOME=/root"
cmd+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
cmd+=" TERM=\$TERM"
cmd+=" LANG=C.UTF-8"
cmd+=" /bin/bash --login"
if [ -z "\$1" ]; then
    exec \$cmd
else
    \$cmd -c "\$@"
fi
EOM

echo "Updating shebang for $launch_script..."
termux-fix-shebang $launch_script

echo "Making $launch_script executable..."
chmod +x $launch_script

echo "Ubuntu is ready! Launch it with ./$launch_script"
