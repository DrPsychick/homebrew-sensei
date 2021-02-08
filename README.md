### Read sensor information from IORegistry
A small macOS utility that reads information from IORegistry

#### Current status
* prints `AppleSmartBattery` information

Example
```shell script
> sensei
temperature=29.4,charging=0,remaining_cycles=78.6,remaining_capacity=89.3,capacity=95.3
```

Explanation
* `temperature` : in celsius
* `charging` : 1 = yes, 0 = no
* `remaining_cycles` : % of charging cycles compared to design cycles (e.g. how many charging cycles are left in %)
* `remaining_capacity` : % of max capacity compared to design capacity (e.g. how much of the original capacity is left in %)
* `capacity` : % of current charged capacity

### Install with homebrew
```shell script
> brew install drpsychick/sensei/sensei
# OR
> brew tap drpsychick/sensei
> brew install sensei
```

### Build + Run
```shell script
> cmake . -GNinja
...
> ninja
...
> ./sensei
temperature=29.4,charging=0,remaining_cycles=78.6,remaining_capacity=89.3,capacity=95.3
```