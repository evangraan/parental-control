# parental-control
Simple light-weight Ubuntu parental control service that limits the cumulative time spent running specific processes (e.g. games) on a single day. If the CAP is exceeded, the Linux system shuts down.

## Installation

```
sudo -i
mkdir /opt/parental-control
cp <repo-path>/parental-control.sh /opt/parental-control.sh
chmod +x /opt/parental-control.sh

cp <repo-path>/parental-control.service /etc/systemd/system/parental-control.service
```

## Configuration
```
sudo vi /opt/parental-control.sh
```

Edit the PROCESSES and CAP parameters as required.

## Service management
```
sudo systemctl stop parental-control
sudo systemctl start parental-control
```

Ensure start on boot:

```
systemctl enable parental-control.service
```
