# Install SolusOS on macbook pro (TODO MODEL)

## Install

TODO

## First boot

1. Update system

2. Install wireless drivers

    - [source](https://solus-project.com/forums/viewtopic.php?f=4&t=7632&start=10#p34530)

    ```shell
    sudo -i
    eopkg update
    eopkg install broadcom-sta-current
    echo 'install wl /sbin/modprobe cfg80211; /sbin/insmod /lib/modules/$(/bin/uname -r)/kernel/drivers/net/wireless/wl.ko' > /etc/modprobe.d/wl.conf
    echo wl > /etc/modules-load.d/wl.conf
    modprobe wl
    exit
    ```

3. Fn key in mode 2

    - [source](https://solus-project.com/forums/viewtopic.php?t=7686)

    1. Create a new file for SystemD to start.

        ```shell
        gedit /usr/lib/systemd/system/mac-keyboard.service
        ```

    2. Ensure the file contains the following

        ```shell
        [Unit]
        Description=mac-keyboard
        [Service]
        Type=oneshot
        ExecStart=/bin/sh -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"
        ExecStop=/bin/sh -c "echo 1 > /sys/module/hid_apple/parameters/fnmode"
        RemainAfterExit=yes
        [Install]
        WantedBy=multi-user.target
        ```

    3. Reload SystemD to read your new file

        ```shell
        systemctl --system daemon-reload
        ```

    4. Start the SystemD service.

        ```shell
        systemctl start mac-keyboard.service
        ```

    5. Enable service to start on boot.

        ```shell
        systemctl enable mac-keyboard.service
        ```

4. Install dotfiles

    ```shell
    cd /tmp
    curl -O https://raw.githubusercontent.com/hugdubois/dotfiles/master/bin/dotfiles-install-solusos
    ./dotfiles-install-solusos
    sudo chsh -s $(which fish) $(whoami)
    ```
