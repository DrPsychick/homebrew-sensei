### Read sensor information from IORegistry
A small macOS utility that reads information from IORegistry

#### Current status
* prints `AppleSmartBattery` information

### Build + Run
```shell script
> cmake . -GNinja
...
> ninja
...
> ./sensei
temperature=29.4,charging=0,remaining_cycles=78.6,remaining_capacity=89.3,capacity=95.3
```